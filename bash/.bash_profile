pathPush() {
	local dir="$1"
	if [ -d "$dir" ]; then
		PATH="${dir}${PATH:+:${PATH}}"
	fi
}
export -f pathPush

sourceIfExists() {
	local script="$1"
	if [ -e "${script}" ]; then
		. "${script}"
		return 0
	fi
	return 1
}
export -f sourceIfExists

sourceDir() {
	local dir="$1"
	mapfile -t < <(shopt -s nullglob; for file in "${dir}"/*; do echo "${file}"; done)
	for file in "${MAPFILE[@]}"; do
		. "${file}"
	done
}
export -f sourceDir

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

pathPush "/usr/local/sbin"
pathPush "${HOME}/.nodebrew/current/bin"
pathPush "${HOME}/bin"

sourceDir "${HOME}/.bash_profile.d"
sourceIfExists "${HOME}/.bash_profile.local"
sourceIfExists "${HOME}/.bashrc"
