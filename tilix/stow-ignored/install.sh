#!/usr/bin/env bash
set -euf -o pipefail

if hash -r tilix dconf 2> /dev/null; then
	dconf load /com/gexperts/Tilix/ <<- END_OF_CONFIGURATION
[/]
app-title='\${activeTerminalTitle}'
close-with-last-session=true
new-instance-mode='new-session'
quake-active-monitor=true
quake-height-percent=100
quake-hide-headerbar=true
quake-specific-monitor=1
quake-tab-position='top'
quake-width-percent=100
session-name='\${activeTerminalTitle}'
tab-position='top'
terminal-title-show-when-single=false
terminal-title-style='normal'
theme-variant='system'
use-tabs=true
warn-vte-config-issue=false
window-style='borderless'

[keybindings]
win-switch-to-next-session='<Alt>z'
win-switch-to-previous-session='<Alt><Shift>z'

[profiles/2b7c4080-0ddd-46c5-8f23-563fd3ba789d]
background-transparency-percent=6
badge-text=''
cursor-blink-mode='on'
custom-command='screen'
font='UbuntuMono Nerd Font 14'
scroll-on-keystroke=false
scrollback-lines=256
scrollback-unlimited=false
show-scrollbar=false
terminal-bell='icon'
terminal-title='~'
use-custom-command=true
use-system-font=false
visible-name='Default'
END_OF_CONFIGURATION
else
	__warn
	echo "Unable to install Tilix configuration (either tilix or dconf is missing)" >&2
	__default
fi
