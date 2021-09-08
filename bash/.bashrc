declare -A _PROFILING_TICK
export _PROFILING_TICK
_shell_profiling_reset() {
	_PROFILING_TICK[$1]=$(date +"%s%N")
}
export -f _shell_profiling_reset

_shell_profiling_lap() {
	echo "$1: $((($(date +"%s%N") - ${_PROFILING_TICK[$1]}) / 1000000))ms"
}
export -f _shell_profiling_lap

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

# https://sanctum.geek.nz/arabesque/better-bash-history/
shopt -s histappend cmdhist
export HISTFILESIZE=10000
export HISTSIZE=10000
export HISTCONTROL=ignoredups
export HISTIGNORE='ls:bg:fg:history'
export HISTTIMEFORMAT='%F %T '

if ls --version | grep -qF "GNU coreutils"; then
	alias ls="ls --color=auto"
fi

if hash -r brew 2> /dev/null && BREW_PREFIX="$(brew --prefix 2> /dev/null)"; then
	_dotfilesSourceIfExists "${BREW_PREFIX}/etc/bash_completion"
fi

_dotfilesSourceIfExists /etc/bash_completion

for script in "${HOME}/.bashrc.d"/*; do . "${script}"; done
_dotfilesSourceIfExists "${HOME}/.bashrc.local"
