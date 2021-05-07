FONTS="${HOME}/.fonts"
NERD_FONTS_VERSION="$(curl -s "https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest" | awk -F'[ ":,]+' '/tag_name/{print $3}')"

mkdir -p "${FONTS}"
(
	cd "${FONTS}"
	curl -sLO https://github.com/ryanoasis/nerd-fonts/releases/download/${NERD_FONTS_VERSION}/UbuntuMono.zip
	unzip -f UbuntuMono.zip
	rm UbuntuMono.zip
)

fc-cache -f
echo "Don't forget to set your terminal font to UbuntuMono Nerd Font Mono"
