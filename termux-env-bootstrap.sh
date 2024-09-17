#!/bin/sh
set -e

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

# Call setup script
~/.termux-bootstrap/termux-env-setup
