#!/bin/bash
set -e

if [ "$1" = "installed" ]; then
    [ -d ~/.termux-bootstrap/.git_config/ ]
elif [ "$1" = "install" ]; then
    rm -rf ~/.termux-bootstrap/.git_config
    git clone git@gist.github.com:7be636e10838e7454338af935bf66beb.git \
	~/.termux-bootstrap/.git_config
    chmod +x ~/.termux-bootstrap/.git_config/git_config.sh
    ~/.termux-bootstrap/.git_config/git_config.sh
fi
