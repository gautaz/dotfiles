_dotfilesPathPush() {
	local dir="$1"
	if [ -d "$dir" ]; then
		PATH="${dir}${PATH:+:${PATH}}"
	fi
}
export -f _dotfilesPathPush

_dotfilesSourceIfExists() {
	local script="$1"
	if [ -e "${script}" ]; then
		. "${script}"
		return 0
	fi
	return 1
}
export -f _dotfilesSourceIfExists

export PATH
export CLICOLOR=yes
export EDITOR="vi"

_dotfilesPathPush "/usr/local/share/pypy3"
_dotfilesPathPush "/usr/local/share/pypy"
_dotfilesPathPush "/usr/local/sbin"
_dotfilesPathPush "${HOME}/.nodebrew/current/bin"
_dotfilesPathPush "${HOME}/bin"

for script in "${HOME}/.bash_profile.d"/*; do . "${script}"; done
_dotfilesSourceIfExists "${HOME}/.bash_profile.local"
_dotfilesSourceIfExists "${HOME}/.bashrc"
