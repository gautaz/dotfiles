HELM_CMD="${HOME}/stow/helm/bin/helm"

PLATFORM="$(uname -s)"
declare -A HELM_ARCH=( ["x86_64"]="amd64" ["aarch64"]="arm64" )
FLAVOR="${PLATFORM,,}-${HELM_ARCH[$(uname -m)]}"

mkdir -p "${HELM_CMD%/*}"
curl -sfL "https://get.helm.sh/helm-$(__gh_latest_tag helm/helm)-${FLAVOR}.tar.gz" | tar xzOf - "${FLAVOR}/helm" > "${HELM_CMD}"
chmod u+x "${HELM_CMD}"
stow -d "${HOME}/stow" "helm"

HELM_COMPLETION="helm/.bash_completion.d"
mkdir -p "${HELM_COMPLETION}"
"${HELM_CMD}" completion bash > "${HELM_COMPLETION}/helm"
