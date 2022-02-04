HELM_HOME="${HOME}/.helm"
HELM_VERSION="$(curl -sf "https://api.github.com/repos/helm/helm/releases/latest" | awk -F'[ ":,]+' '/tag_name/{print $3}')"

PLATFORM="$(uname -s)"
ARCH="$(uname -m)"
declare -A HELM_ARCH=( ["x86_64"]="amd64" ["aarch64"]="arm64" )
FLAVOR="${PLATFORM,,}-${HELM_ARCH[$(uname -m)]}"

mkdir -p "${HELM_HOME}/bin"
curl -sfLo - "https://get.helm.sh/helm-${HELM_VERSION}-${FLAVOR}.tar.gz" | tar xzOf - "${FLAVOR}/helm" > "${HELM_HOME}/bin/helm"
chmod u+x "${HELM_HOME}/bin/helm"

HELM_COMPLETION="helm/.bash_completion.d"
mkdir -p "${HELM_COMPLETION}"
"${HELM_HOME}/bin/helm" completion bash > "${HELM_COMPLETION}/helm"
