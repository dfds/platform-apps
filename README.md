# Platform Apps - a catalogue of apps for Flux CD

This repository has the **specification** of Flux CD resources for different apps.

The *sources* directory contains Flux CD sources, like Helm repositories.

The *apps* directory contains sub directories with Flux CD Helm releases, charts and opinionated chart values.

## Usage

In order to implement the resources in this repository you need the following on your **implementation** side:

- platform-apps.yaml: References this repository as a Flux CD git source and also references the Helm repositores from the *sources* directory.
- kustomization.yaml

### platform-apps.yaml example

```yaml
---
apiVersion: source.toolkit.fluxcd.io/v1
kind: GitRepository
metadata:
  name: platform-apps-git
  namespace: flux-system
spec:
  interval: 1m0s
  ref:
    branch: main
  url: https://github.com/dfds/platform-apps
---
apiVersion: kustomize.toolkit.fluxcd.io/v1
kind: Kustomization
metadata:
  name: platform-apps-sources
  namespace: flux-system
spec:
  interval: 1m0s
  sourceRef:
    kind: GitRepository
    name: platform-apps-git
  path: ./sources
  prune: true
```

### kustomization.yaml example

This is a standard k8s Kustomization resource where we reference the specific app we want to install with Flux.
This will contain a link to the specific app under the apps folder; in this example *traefik*.

Optionally it can also contain a **patches** section that includes inline YAML, if we want to patch any of the Helm chart values.

```yaml
----
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
resources:
  - https://github.com/dfds/platform-apps/apps/traefik
patches:
  - patch: |-
      apiVersion: helm.toolkit.fluxcd.io/v2beta1
      kind: HelmRelease
      metadata:
        name: traefik
        namespace: traefik
      spec:
        values:
          ports:
            web:
              nodePort: 31000
            traefik:
              nodePort: 31001
```

### Terraform

In our setup we use the the <https://github.com/dfds/infrastructure-modules/tree/master/_sub/compute/k8s-traefik-flux> Terraform module to generate the kustomization.yaml files.

## Development practices

- Create a feature branch from main branch.
- When you are ready to test your feature in QA, merge it to the qa branch without a pull request.
- When you are ready with your feature, raise a pull request

![GIt workflow](./platform-apps-git.drawio.png "Git workflow")

### Merge conflicts

- We have a nightly build than merges main into qa and staging branches.
- Because different feature branches might be updating the same files, we sometimes get merge conflicts.
- These merge conflicts are discovered when the nightly job merges from main to qa.
- These merge conflicts needs to be fixed manually.
