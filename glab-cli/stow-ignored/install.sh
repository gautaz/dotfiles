GLAB_CLI_HOME="${HOME}/.glab-cli"
GLAB_CLI_VERSION="$(curl -s "https://api.github.com/repos/profclems/glab/releases/latest" | awk -F'[ ":,]+' '/tag_name/{print $3}')"

mkdir -p "${GLAB_CLI_HOME}"
curl -sL "https://github.com/profclems/glab/releases/download/${GLAB_CLI_VERSION}/glab_${GLAB_CLI_VERSION:1}_$(uname -s)_$(uname -m).tar.gz" | tar xzf - -C "${GLAB_CLI_HOME}"

GLAB_CLI_COMPLETION="glab-cli/.bash_completion.d"
mkdir -p "${GLAB_CLI_COMPLETION}"
"${GLAB_CLI_HOME}/bin/glab" completion -s bash > "${GLAB_CLI_COMPLETION}/glab-cli"
