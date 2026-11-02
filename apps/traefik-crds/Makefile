SHELL = /usr/bin/env bash

traefik_chart_repo := https://traefik.github.io/charts
traefik_chart_version := 42.2.0
gateway_api_version := v1.6.3

all: crds.yaml

crds.yaml:
	{ \
	  helm show crds traefik --repo $(traefik_chart_repo) --version $(traefik_chart_version) | yq 'select(.spec.group == "traefik.io")' --exit-status; \
	  echo '---'; \
	  curl -fsSL https://github.com/kubernetes-sigs/gateway-api/releases/download/$(gateway_api_version)/standard-install.yaml; \
	} > $@

.PHONY: all crds.yaml
