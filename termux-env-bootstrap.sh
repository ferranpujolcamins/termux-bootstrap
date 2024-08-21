#!/bin/sh

# install gh
pkg update
pkg upgrade -y
pkg install -y \
    gh \
    git

# login to gh
gh auth login -h GitHub.com -p ssh

# setup git
eval "$(gh gist view --raw 7be636e10838e7454338af935bf66beb | tail -n +2)"
git config --global gpg.format ssh
git config --global user.signingkey ~/.ssh/id_ed25519.pub

# clone this repo
gh repo clone ferranpujolcamins/termux-bootstrap ~/.termux-bootstrap

# add scripts to path
touch ~/.bashrc
echo "export PATH=$PATH:~/.termux-bootstrap\n" >> ~/.bashrc
source ~/.bashrc

# call setup script
termux-env-setup
