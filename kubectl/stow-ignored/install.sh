KUBECTL_CMD="${HOME}/stow/kubectl/bin/kubectl"

PLATFORM="$(uname -s)"
declare -A KUBECTL_ARCH=( ["x86_64"]="amd64" ["aarch64"]="arm64" )

mkdir -p "${KUBECTL_CMD%/*}"
curl -sfL "https://dl.k8s.io/release/$(curl -sfL https://dl.k8s.io/release/stable.txt)/bin/${PLATFORM,,}/${KUBECTL_ARCH[$(uname -m)]}/kubectl" -o "${KUBECTL_CMD}"
chmod u+x "${KUBECTL_CMD}"
stow -d "${HOME}/stow" "kubectl"

KUBECTL_COMPLETION="kubectl/.bash_completion.d"
mkdir -p "${KUBECTL_COMPLETION}"
"${KUBECTL_CMD}" completion bash > "${KUBECTL_COMPLETION}/kubectl"
