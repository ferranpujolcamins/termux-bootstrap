#!/bin/bash
set -e

if [ "$1" = "installed" ]; then
    [ "$(fc-scan --format "%{fullname}\n" ~/.termux/font.ttf)" = 'Inconsolata Regular' ]
elif [ "$1" = "install" ]; then
    rm -f ~/.termux/font.ttf
    curl -fsSL -o ~/.termux/font.ttf \
	 https://raw.githubusercontent.com/googlefonts/Inconsolata/fc1fc21081558b39a2db43bfd9b65bf9acb50701/fonts/ttf/Inconsolata-Regular.ttf
    termux-reload-settings
fi

