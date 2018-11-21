_dotfilesPathPush() {
	local dir="$1"
	if [ -d "$dir" ]; then
		PATH="${dir}${PATH:+:${PATH}}"
	fi
}

_dotfilesSourceIfExists() {
	local script="$1"
	if [ -e "${script}" ]; then
		. "${script}"
		return 0
	fi
	return 1
}

export LANG=en_US.UTF-8
export PATH
export CLICOLOR=yes
export EDITOR="vi"

_dotfilesPathPush "/usr/local/sbin"
_dotfilesPathPush "/usr/local/opt/gettext/bin"
_dotfilesPathPush "$HOME/Library/Haskell/bin"
_dotfilesPathPush "${HOME}/bin"

for script in "${HOME}/.bash_profile.d"/*; do . "${script}"; done
_dotfilesSourceIfExists "${HOME}/.bash_profile.local"
_dotfilesSourceIfExists "${HOME}/.bashrc"
