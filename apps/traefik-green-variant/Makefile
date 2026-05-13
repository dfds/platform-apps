SHELL = /usr/bin/env bash

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
all: manifests

# Render template with helm (filtering away noisy annotations when diffing and skipping schema validation to avoid error on ports.web.nodePort validation)
manifests: $(release) $(source)
	mkdir -p manifests
	rm -rf manifests/*
	helm template $(name) $(chart) --repo $(url) --version $(version) --namespace $(namespace) --skip-crds -f <(echo "$$($(values))") --skip-schema-validation | grep -vE "helm.sh/chart|app.kubernetes.io/version" | yq -s '"manifests/" + .kind + "-" + .metadata.name'

.PHONY: all manifests