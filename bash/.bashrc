_dotfilesSourceIfExists() {
	local script="$1"
	if [ -e "${script}" ]; then
		. "${script}"
		return 0
	fi
	return 1
}

BASH="$(which bash)"
SHELL="${BASH}"
GIT_PROMPT_THEME=Solarized_UserHost

# https://sanctum.geek.nz/arabesque/better-bash-history/
shopt -s histappend cmdhist
export HISTFILESIZE=10000
export HISTSIZE=10000
export HISTCONTROL=ignoredups
export HISTIGNORE='ls:bg:fg:history'
export HISTTIMEFORMAT='%F %T '

if BREW_PREFIX="$(brew --prefix 2> /dev/null)"; then
	_dotfilesSourceIfExists "${BREW_PREFIX}/etc/bash_completion"
fi

_dotfilesSourceIfExists /etc/bash_completion

for script in "${HOME}/.bashrc.d"/*; do . "${script}"; done
_dotfilesSourceIfExists "${HOME}/.bashrc.local"
