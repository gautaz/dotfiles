#!/usr/bin/env bash
KIND_CMD="${HOME}/stow/kind/bin/kind"

PLATFORM="$(uname -s)"
declare -A KIND_ARCH=( ["x86_64"]="amd64" ["aarch64"]="arm64" )

mkdir -p "${KIND_CMD%/*}"
curl -sfL "https://github.com/kubernetes-sigs/kind/releases/download/$(__gh_latest_tag "kubernetes-sigs/kind")/kind-${PLATFORM,,}-${KIND_ARCH[$(uname -m)]}" -o "${KIND_CMD}"
chmod u+x "${KIND_CMD}"
stow -d "${HOME}/stow" "kind"

KIND_COMPLETION="kind/.bash_completion.d"
mkdir -p "${KIND_COMPLETION}"
"${KIND_CMD}" completion bash > "${KIND_COMPLETION}/kind"
