#!/usr/bin/env bash
GLAB_CLI_CMD="${HOME}/stow/glab-cli/bin/glab"
GLAB_CLI_VERSION="$(__gh_latest_tag "profclems/glab")"

mkdir -p "${GLAB_CLI_CMD%/*}"
curl -sfL "https://github.com/profclems/glab/releases/download/${GLAB_CLI_VERSION}/glab_${GLAB_CLI_VERSION:1}_$(uname -s)_$(uname -m).tar.gz" | tar xzOf - "bin/glab" > "${GLAB_CLI_CMD}"
chmod u+x "${GLAB_CLI_CMD}"
stow -d "${HOME}/stow" "glab-cli"

GLAB_CLI_COMPLETION="glab-cli/.bash_completion.d"
mkdir -p "${GLAB_CLI_COMPLETION}"
"${GLAB_CLI_CMD}" completion -s bash > "${GLAB_CLI_COMPLETION}/glab-cli"
