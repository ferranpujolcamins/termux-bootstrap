#!/bin/sh
set -e

echo ""
echo "===================="
echo "Set inconsolata font:"
echo "===================="
rm -f .termux/font.ttf
curl -fsSL -o .termux/font.ttf https://raw.githubusercontent.com/googlefonts/Inconsolata/fc1fc21081558b39a2db43bfd9b65bf9acb50701/fonts/ttf/Inconsolata-Regular.ttf
termux-reload-settings

echo ""
echo "================="
echo "Install GH & git:"
echo "================="
pkg update
pkg upgrade -y
pkg install -y \
    gh \
    git \
    openssh

echo ""
echo "==========================="
echo "Login to GH to set ssh key:"
echo "==========================="
gh auth login -h GitHub.com -p ssh
pkg uninstall -y gh
rm -rf ~/.config/gh

echo ""
echo "==============="
echo "Clone the repo:"
echo "==============="
rm -rf ~/.termux-bootstrap/
git clone git@github.com:ferranpujolcamins/termux-bootstrap.git ~/.termux-bootstrap
# If directory does not exist...
if [ ! -d ~/.termux-bootstrap ]; then
    echo "Repo was not cloned. Have you set up an ssh key?"
    exit 1
fi
# If directory is empty...
if [ -z "$( ls -A ~/.termux-bootstrap )" ]; then
    echo "Repo was not cloned. Have you set up an ssh key?"
    exit 1
fi

echo ""
echo "==========="
echo "Set up git:"
echo "==========="
git clone git@gist.github.com:7be636e10838e7454338af935bf66beb.git \
    ~/.termux-bootstrap/.git_config
chmod +x ~/.termux-bootstrap/.git_config/git_config.sh
~/.termux-bootstrap/.git_config/git_config.sh

echo ""
echo "=========="
echo "Setup ZSH:"
echo "=========="
cp ~/.termux-bootstrap/.zshrc ~/.zshrc
pkg install -y zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" \
    "" --keep-zshrc --unattended
chsh -s zsh

echo ""
echo "=================="
echo "Call setup script:"
echo "=================="
# This isn't in the PATH just yet
~/.termux-bootstrap/termux-env-setup

echo ""
echo "=============="
echo "Switch to ZSH:"
echo "=============="
exec zsh -l
