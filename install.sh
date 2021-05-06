#!/usr/bin/env bash
set -o errexit

if ! hash -r stow &> /dev/null; then
	echo "stow is missing"
	exit 1
fi

pushd "$(dirname "${BASH_SOURCE[0]}")" > /dev/null

find */ -path "*/stow-ignored/install.sh" -print0 | while read -r -d $'\0' INSTALL; do
	echo "${INSTALL}"
	. "${INSTALL}"
done

stow -t "${HOME}" -R --ignore=stow-ignored */

popd > /dev/null
