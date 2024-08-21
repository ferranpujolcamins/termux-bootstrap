#!/bin/sh

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
cd 

echo "Set up git:"
gh gist clone 7be636e10838e7454338af935bf66beb .git_config
chmod +x .termux-bootstrap/git_config/git_config.sh
.termux-bootstrap/.git_config/git_config.sh

echo "Add scripts to path:"
touch ~/.bashrc
echo "export PATH=$PATH:~/.termux-bootstrap\n" >> ~/.bashrc
source ~/.bashrc

echo "Call setup script:"
termux-env-setup
