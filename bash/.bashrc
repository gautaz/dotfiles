if BREW_PREFIX="$(brew --prefix 2> /dev/null)"; then
	sourceIfExists "${BREW_PREFIX}/etc/bash_completion"
	sourceIfExists "${BREW_PREFIX}/opt/bash-git-prompt/share/gitprompt.sh"
fi

sourceIfExists "${HOME}/.bashrc.local"
