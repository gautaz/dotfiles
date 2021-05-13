if hash -r dconf 2> /dev/null; then
	dconf load /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/ <<- END_OF_CONFIGURATION
[custom0]
binding='<Alt>q'
command='tilix --quake'
name='Tilix Quake'

[custom1]
binding='<Alt>s'
command='flameshot gui'
name='Flameshot'
END_OF_CONFIGURATION
	__info
	dconf dump /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/ | awk -F "[=']+" '/^binding=/{BINDING=$2}/^name=/{print BINDING " bound to " $2}'
	__default
else
	__warn
	echo "Gnome keybindings are unavailable (dconf is missing)" >&2
	__default
fi
