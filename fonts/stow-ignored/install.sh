FONTS="${HOME}/.fonts"
NERD_FONTS_VERSION="$(curl -sf "https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest" | awk -F'[ ":,]+' '/tag_name/{print $3}')"

mkdir -p "${FONTS}"
(
	cd "${FONTS}"
	curl -sfLO https://github.com/ryanoasis/nerd-fonts/releases/download/${NERD_FONTS_VERSION}/UbuntuMono.zip
	unzip -f UbuntuMono.zip
	rm UbuntuMono.zip
)

fc-cache -f
