_dotfilesPathPush() {
	if [ -d "$1" ] && echo "${PATH}" | grep -qvE "$1(:|$)"; then
		PATH="$1:${PATH}"
	fi
}

_dotfilesSourceIfExists() {
	if [ -e "$1" ]; then
		. "$1"
	fi
}

export UID
export GID="$(id -g)"
export PATH
export LANG=en_US.UTF-8
export LANGUAGE="${LANG}"
export LC_ALL="${LANG}"
export EDITOR="vi"

_dotfilesPathPush "/usr/local/sbin"
_dotfilesPathPush "${HOME}/bin"

for script in "${HOME}/.profile.d"/*; do . "${script}"; done
_dotfilesSourceIfExists "${HOME}/.profile.local"
