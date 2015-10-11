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

ssn() {
	while [ $# -gt 0 ]; do
		case "$1" in
			-p)
				local remote_port="$2"; shift
				;;
			*)
				local address="$1"
				;;
		esac
		shift
	done
	ssh -t ${remote_port:+-p "${remote_port}"} "${address}" screen -DRR
}
export -f ssn

export PATH
export CLICOLOR=yes
export EDITOR="vi"

_dotfilesPathPush "/usr/local/sbin"
_dotfilesPathPush "${HOME}/.nodebrew/current/bin"
_dotfilesPathPush "${HOME}/bin"

for script in "${HOME}/.bash_profile.d"/*; do . "${script}"; done
_dotfilesSourceIfExists "${HOME}/.bash_profile.local"
_dotfilesSourceIfExists "${HOME}/.bashrc"
