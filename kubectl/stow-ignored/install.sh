#!/usr/bin/env bash
set -euf -o pipefail

KUBECTL_CMD="${HOME}/stow/kubectl/bin/kubectl"

mkdir -p "${KUBECTL_CMD%/*}"
curl -sfL "https://dl.k8s.io/release/$(curl -sfL https://dl.k8s.io/release/stable.txt)/bin/${GOOS}/${GOARCH}/kubectl" -o "${KUBECTL_CMD}"
chmod u+x "${KUBECTL_CMD}"
stow -d "${HOME}/stow" "kubectl"

KUBECTL_COMPLETION="kubectl/.bash_completion.d"
mkdir -p "${KUBECTL_COMPLETION}"
"${KUBECTL_CMD}" completion bash > "${KUBECTL_COMPLETION}/kubectl"
