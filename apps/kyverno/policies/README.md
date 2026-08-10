# Testing Kyverno policies

We have a lot of policies in place and it is important that validate them. In many cases this can be done via the Kyverno cli using the test command. In some cases local testing is not yet possible because we are calling internal services to check compliance, that are not available.

## Requirement

- [Kyverno cli](https://kyverno.io/docs/subprojects/kyverno-cli/)
- [Pre-commit](https://pre-commit.com/#install) for automation

## How does it work

The [Kyverno cli test command](https://kyverno.io/docs/subprojects/kyverno-cli/#test-command) will look for on or more files to be called `kyverno-test.yaml`. The main structure is pretty straight forward.

```yaml
apiVersion: cli.kyverno.io/v1alpha1
kind: Test
metadata:
  name: example-test
policies:
  - example-policy.yaml
resources:
  - tests/ # we locate or test resources in a folder called tests/
...
results:
  - policy: example
    rule: example-rule
    resources:
      - default/example # namespace/name of resource
    kind: Deployment
    result: pass
...
```

This is a really simplified example, but hopefully it gets the point across. But for a more real world example see `apps/kyverno/policies/operational/kyverno-test.yaml`

All tests can be run locally by running `kyverno test .` in the root of the project.

## Automation

We have added Kyverno test command to pre-commit hooks, which we also running on PR creation see Github Action `.github/workflows/pre-commit.yaml`.
