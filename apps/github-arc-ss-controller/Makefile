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
all: crds.yaml manifests

# Generate CRDs with helm
crds.yaml: $(release) $(source)
	helm show crds $(url) --version $(version) > $@

# Render template with helm (filtering away noisy annotations when diffing)
manifests: $(release) $(source)
	mkdir -p manifests
	rm -rf manifests/*
	helm template $(name) $(url) --version $(version) --namespace $(namespace) --skip-crds -f <(echo "$$($(values))") | grep -vE "helm.sh/chart|app.kubernetes.io/version" | yq -s '"manifests/" + .kind + "-" + .metadata.name'
