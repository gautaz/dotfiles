BASH="$(which bash)"
SHELL="${BASH}"
GIT_PROMPT_THEME=Default

if BREW_PREFIX="$(brew --prefix 2> /dev/null)"; then
	_dotfilesSourceIfExists "${BREW_PREFIX}/etc/bash_completion"
	_dotfilesSourceIfExists "${BREW_PREFIX}/opt/bash-git-prompt/share/gitprompt.sh"
fi

_dotfilesSourceIfExists "${HOME}/.bashrc.local"
