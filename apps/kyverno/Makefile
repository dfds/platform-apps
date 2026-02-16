repo := sources.yaml # where to find HelmRepository
release := release.yaml # where to find HelmRelease

# Fetch data from HelmRepository and HelmRelease
name := $(shell yq '. | select(.kind == "HelmRelease") | .metadata.name' $(release))
namespace := $(shell yq '. | select(.kind == "HelmRelease") | .metadata.namespace' $(release))
version := $(shell yq '. | select(.kind == "HelmRelease") | .spec.chart.spec.version' $(release))
url := $(shell yq '. | select(.kind == "HelmRepository") | .spec.url' $(repo))
chart := $(shell yq '. | select(.kind == "HelmRelease") | .spec.chart.spec.chart' $(release))

# Run all tasks
all: manifests crds.yaml cleanup

# Generate CRDs with yq since this helm chart doesn't support helm show crds
crds.yaml:
	echo "" > crds.yaml
	yq '. | select(.kind == "CustomResourceDefinition")' tmp/template.yaml >> crds.yaml

# Generate manifests with helm (filtering away noisy annotations when diffing)
manifests: $(release) $(repo)
	mkdir -p tmp
	yq '. | select(.kind == "HelmRelease") | .spec.values' release.yaml > tmp/values.yaml
	helm template $(name) $(chart) --repo $(url) --version $(version) --namespace $(namespace) --skip-crds -f tmp/values.yaml | grep -vE "helm.sh/chart|app.kubernetes.io/version" > tmp/template.yaml
	mkdir -p manifests
	rm -rf manifests/*
	yq -s '"manifests/" + .kind + "-" + .metadata.name' tmp/template.yaml

cleanup:
	rm -rf tmp
