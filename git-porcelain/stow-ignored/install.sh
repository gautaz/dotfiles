#!/usr/bin/env bash
set -euf -o pipefail

GIT_PORCELAIN_HOME="$(dirname "${PWD}")/git-porcelain"
if [ ! -d "${GIT_PORCELAIN_HOME}" ]; then
	git clone https://github.com/gautaz/git-porcelain.git "${GIT_PORCELAIN_HOME}"
else
	(cd "${GIT_PORCELAIN_HOME}" && git fetch -a -p && git pull)
fi
rm -f "${HOME}/.git-porcelain"
ln -s "${GIT_PORCELAIN_HOME#${HOME}/}" "${HOME}/.git-porcelain"
