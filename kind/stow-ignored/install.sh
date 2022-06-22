#!/usr/bin/env bash
set -euf -o pipefail

KIND_CMD="${HOME}/stow/kind/bin/kind"

mkdir -p "${KIND_CMD%/*}"
curl -sfL "https://github.com/kubernetes-sigs/kind/releases/download/$(__gh_latest_tag "kubernetes-sigs/kind")/kind-${GOOS}-${GOARCH}" -o "${KIND_CMD}"
chmod u+x "${KIND_CMD}"
stow -d "${HOME}/stow" "kind"

KIND_COMPLETION="kind/.bash_completion.d"
mkdir -p "${KIND_COMPLETION}"
"${KIND_CMD}" completion bash > "${KIND_COMPLETION}/kind"
