#!/bin/sh

echo "Set inconsolata font"
rm -f .termux/font.ttf
curl -o .termux/font.ttf https://raw.githubusercontent.com/googlefonts/Inconsolata/fc1fc21081558b39a2db43bfd9b65bf9acb50701/fonts/ttf/Inconsolata-Regular.ttf
termux-reload-settings

echo "Install GH & git:"
pkg update
pkg upgrade -y
pkg install -y \
    gh \
    git

echo "Login to GH to set ssh key:"
gh auth login -h GitHub.com -p ssh
pkg uninstall gh
rm -rf ~/.config/gh

echo "Clone the repo:"
rm -rf ~/.termux-bootstrap/
gh repo clone ferranpujolcamins/termux-bootstrap ~/.termux-bootstrap

echo "Set up git:"
git clone git@gist.github.com:7be636e10838e7454338af935bf66beb.git \
    ~/.termux-bootstrap/.git_config
chmod +x ~/.termux-bootstrap/.git_config/git_config.sh
~/.termux-bootstrap/.git_config/git_config.sh

echo "Add scripts to path:"
rm -f ~/.zshrc
echo "export PATH=$PATH:~/.termux-bootstrap" >> ~/.zshrc
source ~/.zshrc

echo "Setup ZSH"
pkg install zsh
chsh -s zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Call setup script:"
termux-env-setup
