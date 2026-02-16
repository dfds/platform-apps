SHELL = /usr/bin/env bash
.PHONY: all render

# Find HelmRelease and Source files
release := $(shell yq '. | select(.kind=="HelmRelease") | filename' *.yaml)
source := $(shell yq '. | select(.kind=="HelmRepository") | filename' *.yaml)

# Fetch data from HelmRepository and HelmRelease
name := $(shell yq '.metadata.name' $(release))
namespace := $(shell yq '.metadata.namespace' $(release))
version := $(shell yq '.spec.chart.spec.version' $(release))
chart := $(shell yq '.spec.chart.spec.chart' $(release))
values := yq '.spec.values' $(release)
url := $(shell yq '.spec.url' $(source))

# Run all tasks
all: crds.yaml render

# Generate CRDs with helm
crds.yaml: $(release) $(source)
	helm template $(name) $(chart) --repo $(url) --version $(version) --include-crds --set crds.install=true | yq '. | select(.kind == "CustomResourceDefinition")' --exit-status > $@

# Render template with helm (filtering away noisy annotations when diffing)
render: $(release) $(source)
	mkdir -p manifests
	rm -rf manifests/*
	helm template $(name) $(chart) --repo $(url) --version $(version) --namespace $(namespace) --skip-crds -f <(echo "$$($(values))") | grep -vE "helm.sh/chart|app.kubernetes.io/version" | yq -s '"manifests/" + .kind + "-" + .metadata.name'

