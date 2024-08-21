#!/bin/sh

echo "\nInstall GH & git:\n"
pkg update
pkg upgrade -y
pkg install -y \
    gh \
    git

echo "\nLogin to GH:\n"
gh auth login -h GitHub.com -p ssh

echo "\nClone the repo:\n"
gh repo clone ferranpujolcamins/termux-bootstrap ~/.termux-bootstrap
cd 

echo "\nSet up git:\n"
eval "$(gh gist view --raw 7be636e10838e7454338af935bf66beb | tail -n +2)"

echo "\nAdd scripts to path:\n"
touch ~/.bashrc
echo "export PATH=$PATH:~/.termux-bootstrap\n" >> ~/.bashrc
source ~/.bashrc

echo "\nCall setup script:\n"
termux-env-setup
