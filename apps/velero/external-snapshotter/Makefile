SHELL = /usr/bin/env bash
.PHONY: all render

# Run all tasks
all: crds.yaml render

# Generate CRDs with kustomize
crds.yaml: kustomization.yaml
	kustomize build . | yq '. | select(.kind == "CustomResourceDefinition")' > $@

# Render template with kustomize (filtering away CRDs)
render: kustomization.yaml volumesnapshotclass.yaml
	mkdir -p manifests
	rm -rf manifests/*
	kustomize build . |yq '. | select(.kind != "CustomResourceDefinition")' | yq -s '"manifests/" + .kind + "-" + .metadata.name'