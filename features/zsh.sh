#!/bin/bash
set -e

if [ "$1" = "installed" ]; then
    dpkg -l | grep -q -e "^ii.*zsh"
elif [ "$1" = "install" ]; then
    cp ~/.termux-bootstrap/.zshrc ~/.zshrc
    pkg install -y zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.\sh)" "" --keep-zshrc --unattended
    chsh -s zsh
fi

