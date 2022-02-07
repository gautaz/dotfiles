#!/usr/bin/env bash
HELM_CMD="${HOME}/stow/helm/bin/helm"
FLAVOR="${GOOS}-${GOARCH}"

mkdir -p "${HELM_CMD%/*}"
curl -sfL "https://get.helm.sh/helm-$(__gh_latest_tag helm/helm)-${FLAVOR}.tar.gz" | tar xzOf - "${FLAVOR}/helm" > "${HELM_CMD}"
chmod u+x "${HELM_CMD}"
stow -d "${HOME}/stow" "helm"

HELM_COMPLETION="helm/.bash_completion.d"
mkdir -p "${HELM_COMPLETION}"
"${HELM_CMD}" completion bash > "${HELM_COMPLETION}/helm"
