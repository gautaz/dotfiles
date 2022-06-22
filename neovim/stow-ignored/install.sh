#!/usr/bin/env bash
set -euf -o pipefail

mkdir -p "${HOME}/.config/nvim/plugged"

curl -sfLo "${HOME}/.config/nvim/autoload/plug.vim" --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

curl -sfLo "${HOME}/.config/nvim/colors/mango.vim" --create-dirs \
	https://raw.githubusercontent.com/goatslacker/mango.vim/master/colors/mango.vim
