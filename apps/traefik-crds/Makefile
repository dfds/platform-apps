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
all: crds.yaml

# Generate CRDs with helm
crds.yaml: $(release) $(source)
	helm template $(name) $(chart) --repo $(url) --version $(version) --include-crds | yq '. | select(.kind == "CustomResourceDefinition")' --exit-status > $@

.PHONY: all