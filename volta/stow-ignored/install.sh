#!/usr/bin/env bash
set -euf -o pipefail

curl -sf https://get.volta.sh | bash -s -- --skip-setup

"${HOME}/.volta/bin/volta" install node
"${HOME}/.volta/bin/volta" install npm

"${HOME}/.volta/bin/volta" install neovim
"${HOME}/.volta/bin/volta" install open-cli
"${HOME}/.volta/bin/volta" install yarn # needed by neovim checkhealth

VOLTA_COMPLETION="volta/.bash_completion.d"
mkdir -p "${VOLTA_COMPLETION}"
"${HOME}/.volta/bin/volta" completions bash > "${VOLTA_COMPLETION}/volta"
"${HOME}/.volta/bin/node" --completion-bash > "${VOLTA_COMPLETION}/node"
"${HOME}/.volta/bin/npm" completion > "${VOLTA_COMPLETION}/npm"
