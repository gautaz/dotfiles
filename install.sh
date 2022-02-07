#!/usr/bin/env bash
set -o errexit

if ! hash -r stow &> /dev/null; then
	echo "stow is missing"
	exit 1
fi

if ! hash -r curl &> /dev/null; then
	echo "curl is missing"
	exit 1
fi

if ! hash -r uname &> /dev/null; then
	echo "uname is missing"
	exit 1
fi

# https://github.com/mutagen-io/mutagen/blob/master/pkg/agent/probe.go
declare -A UNAMES_TO_GOOS=(
["AIX"]="aix"
["Darwin"]="darwin"
["DragonFly"]="dragonfly"
["FreeBSD"]="freebsd"
["Linux"]="linux"
["NetBSD"]="netbsd"
["OpenBSD"]="openbsd"
["SunOS"]="solaris"
)

declare -A UNAMEM_TO_GOARCH=(
["i386"]="386"
["i486"]="386"
["i586"]="386"
["i686"]="386"
["x86_64"]="amd64"
["amd64"]="amd64"
["armv5l"]="arm"
["armv6l"]="arm"
["armv7l"]="arm"
["armv8l"]="arm64"
["aarch64"]="arm64"
["arm64"]="arm64"
["mips"]="mips"
["mipsel"]="mipsle"
["mips64"]="mips64"
["mips64el"]="mips64le"
["ppc64"]="ppc64"
["ppc64le"]="ppc64le"
["riscv64"]="riscv64"
["s390x"]="s390x"
)

GOOS="${UNAMES_TO_GOOS[$(uname -s)]}"

if [[ -z "${GOOS}" ]]; then
	echo "Unable to get Go OS"
	exit 1
fi

GOARCH="${UNAMEM_TO_GOARCH[$(uname -m)]}"

if [[ -z "${GOARCH}" ]]; then
	echo "Unable to get Go architecture"
	exit 1
fi

__info() {
	echo -e '\e[48;5;76m\e[97m'
}

__warn() {
	echo -e '\e[48;5;208m\e[97m'
}

__default() {
	echo -e '\e[49m\e[39m'
}

__gh_latest_tag() {
	local repository="$1"
	curl -sf "https://api.github.com/repos/${repository}/releases/latest" | awk -F'[ ":,]+' '/tag_name/{print $3}'
}

pushd "$(dirname "${BASH_SOURCE[0]}")" > /dev/null

find */ -path "*/stow-ignored/install.sh" -print0 | while read -r -d $'\0' INSTALL; do
	echo "${INSTALL}"
	. "${INSTALL}"
done

stow -t "${HOME}" --ignore=stow-ignored */
stow -t "${HOME}" -R --ignore=stow-ignored */

popd > /dev/null
