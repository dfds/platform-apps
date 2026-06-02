.PHONY: all manifests

SHELL = /usr/bin/env bash

# Find HelmRelease and OCIRepository files
release := $(shell yq '. | select(.kind=="HelmRelease") | filename' *.yaml)
source := $(shell yq '. | select(.kind=="OCIRepository") | filename' *.yaml)

# Fetch data from OCIRepository and HelmRelease
name := $(shell yq '.metadata.name' $(release))
namespace := $(shell yq '.metadata.namespace' $(release))
version := $(shell yq '.spec.ref.tag' $(source))
values := yq '.spec.values' $(release)
url := $(shell yq '.spec.url' $(source))

# Run all tasks
all: manifests

# Render template with helm (filtering away noisy annotations when diffing)
# we to set the controllerServiceAccount values here since they are not set in the HelmRelease but are required for the chart to render due to Helm lookup functionality in the chart
manifests: $(release) $(source)
	mkdir -p manifests
	rm -rf manifests/*
	helm template $(name) $(url) --version $(version) --namespace $(namespace) --skip-crds -f <(echo "$$($(values))") --set controllerServiceAccount.name=arc-gha-rs-controller,controllerServiceAccount.namespace=arc-systems | grep -vE "helm.sh/chart|app.kubernetes.io/version" | yq -s '"manifests/" + .kind + "-" + .metadata.name'