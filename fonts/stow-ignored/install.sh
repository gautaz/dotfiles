#!/usr/bin/env bash
set -euf -o pipefail

FONTS="${HOME}/.fonts"
NERD_FONTS_REPOSITORY="ryanoasis/nerd-fonts"
NERD_FONTS_UBUNTU_ZIP="UbuntuMono.zip"

mkdir -p "${FONTS}"
(
	cd "${FONTS}"
	curl -sfLO "https://github.com/${NERD_FONTS_REPOSITORY}/releases/download/$(__gh_latest_tag "${NERD_FONTS_REPOSITORY}")/${NERD_FONTS_UBUNTU_ZIP}"
	unzip -o "${NERD_FONTS_UBUNTU_ZIP}"
	rm "${NERD_FONTS_UBUNTU_ZIP}"
)

fc-cache -f
echo "========================================"
