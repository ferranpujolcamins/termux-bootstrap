#!/bin/bash
set -e

if [ "$1" = "installed" ]; then
    [ -f ~/.ssh/id_ed25519 ]
elif [ "$1" = "install" ]; then
    echo ""
    echo "Install GH & git:"
    pkg update
    pkg upgrade -y
    pkg install -y \
	gh \
	git \
	openssh

    echo ""
    echo "Login to GH to set ssh key:"
    gh auth login -h GitHub.com -p ssh

    echo ""
    echo "Uninstall GH"
    pkg uninstall -y gh
    rm -rf ~/.config/gh
fi
