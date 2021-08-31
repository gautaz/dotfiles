KIND_HOME="${HOME}/.kind"
KIND_VERSION="$(curl -s "https://api.github.com/repos/kubernetes-sigs/kind/releases/latest" | awk -F'[ ":,]+' '/tag_name/{print $3}')"

PLATFORM="$(uname -s)"
ARCH="$(uname -m)"
declare -A KIND_ARCH=( ["x86_64"]="amd64" ["aarch64"]="arm64" )

mkdir -p "${KIND_HOME}/bin"
curl -sL "https://github.com/kubernetes-sigs/kind/releases/download/${KIND_VERSION}/kind-${PLATFORM,,}-${KIND_ARCH[$(uname -m)]}" -o "${KIND_HOME}/bin/kind"
chmod u+x "${KIND_HOME}/bin/kind"

KIND_COMPLETION="kind/.bash_completion.d"
mkdir -p "${KIND_COMPLETION}"
"${KIND_HOME}/bin/kind" completion bash > "${KIND_COMPLETION}/kind"
