#!/bin/sh

echo "Set inconsolata font"
curl -o .termux/font.ttf https://raw.githubusercontent.com/googlefonts/Inconsolata/fc1fc21081558b39a2db43bfd9b65bf9acb50701/fonts/ttf/Inconsolata-Regular.ttf
termux-reload-settings

echo "Install GH & git:"
pkg update
pkg upgrade -y
pkg install -y \
    gh \
    git

echo "Login to GH:"
gh auth login -h GitHub.com -p ssh

echo "Clone the repo:"
gh repo clone ferranpujolcamins/termux-bootstrap ~/.termux-bootstrap

echo "Set up git:"
gh gist clone 7be636e10838e7454338af935bf66beb .termux-bootstrap/.git_config
chmod +x .termux-bootstrap/.git_config/git_config.sh
.termux-bootstrap/.git_config/git_config.sh

echo "Add scripts to path:"
touch ~/.bashrc
echo "export PATH=$PATH:~/.termux-bootstrap\n" >> ~/.bashrc
source ~/.bashrc

echo "Call setup script:"
termux-env-setup
