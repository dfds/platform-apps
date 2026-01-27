### Extracting Custom Resource Definitions (CRDs)

Use the following command to generate the crds.yaml file. This file will contain all Custom Resource Definitions (CRDs) required by the Helm chart release.

**Note:** Ensure that the VERSION matches the Helm chart version you intend to install.
```
helm show crds $(chart) --repo $(url) --version $(version) > crds.yaml
```