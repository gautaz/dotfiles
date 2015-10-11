#!/usr/bin/env bash

if ! hash -r stow &> /dev/null; then
	echo "stow is missing"
	exit 1
fi

pushd "$(dirname "${BASH_SOURCE[0]}")"
stow -t "${HOME}" -R --ignore=stow-ignored */
popd
