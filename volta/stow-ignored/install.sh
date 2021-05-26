curl -s https://get.volta.sh | bash -s -- --skip-setup

"${HOME}/.volta/bin/volta" install node
"${HOME}/.volta/bin/volta" install npm

"${HOME}/.volta/bin/volta" install neovim-node-host
"${HOME}/.volta/bin/volta" install open-cli
