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
