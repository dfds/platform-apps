SHELL = /usr/bin/env bash

traefik_chart_repo := https://traefik.github.io/charts
traefik_chart_version := 37.4.0
gateway_api_version := v1.6.3

all: crds.yaml

check:
	@set -euo pipefail; \
	  blue_version=$$(yq -r '.spec.chart.spec.version // ""' ../traefik-blue-variant/release.yaml); \
	  green_version=$$(yq -r '.spec.chart.spec.version // ""' ../traefik-green-variant/release.yaml); \
	  if [[ "$(traefik_chart_version)" != "$$blue_version" && "$(traefik_chart_version)" != "$$green_version" ]]; then \
	    echo "Traefik CRD chart version $(traefik_chart_version) must match blue ($$blue_version) or green ($$green_version)" >&2; \
	    exit 1; \
	  fi

crds.yaml: | check
	{ \
	  helm show crds traefik --repo $(traefik_chart_repo) --version $(traefik_chart_version) | yq 'select(.spec.group == "traefik.io")' --exit-status; \
	  echo '---'; \
	  curl -fsSL https://github.com/kubernetes-sigs/gateway-api/releases/download/$(gateway_api_version)/standard-install.yaml; \
	} > $@

.PHONY: all check crds.yaml
