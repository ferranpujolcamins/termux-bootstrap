#!/bin/sh

echo "Set inconsolata font"
rm -f .termux/font.ttf
curl -fsSL -o .termux/font.ttf https://raw.githubusercontent.com/googlefonts/Inconsolata/fc1fc21081558b39a2db43bfd9b65bf9acb50701/fonts/ttf/Inconsolata-Regular.ttf
termux-reload-settings

echo "Install GH & git:"
pkg update
pkg upgrade -y
pkg install -y \
    gh \
    git

echo "Login to GH to set ssh key:"
gh auth login -h GitHub.com -p ssh
pkg uninstall -y gh
rm -rf ~/.config/gh

echo "Clone the repo:"
rm -rf ~/.termux-bootstrap/
git clone git@github.com:ferranpujolcamins/termux-bootstrap.git ~/.termux-bootstrap

echo "Set up git:"
git clone git@gist.github.com:7be636e10838e7454338af935bf66beb.git \
    ~/.termux-bootstrap/.git_config
chmod +x ~/.termux-bootstrap/.git_config/git_config.sh
~/.termux-bootstrap/.git_config/git_config.sh

echo "Setup ZSH"
cp ~/.termux-bootstrap/.zshrc ~/.zshrc
pkg install -y zsh
# The oh-my-zsh installer already activates zsh shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" \
    "" --keep-zshrc --unattended

echo "Call setup script:"
termux-env-setup
