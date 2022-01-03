curl -sf https://get.volta.sh | bash -s -- --skip-setup

"${HOME}/.volta/bin/volta" install node
"${HOME}/.volta/bin/volta" install npm

"${HOME}/.volta/bin/volta" install neovim
"${HOME}/.volta/bin/volta" install open-cli

VOLTA_COMPLETION="volta/.bash_completion.d"
mkdir -p "${VOLTA_COMPLETION}"
volta completions bash > "${VOLTA_COMPLETION}/volta"
node --completion-bash > "${VOLTA_COMPLETION}/node"
npm completion > "${VOLTA_COMPLETION}/npm"
