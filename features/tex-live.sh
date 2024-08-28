#!/bin/bash
set -e

if [ "$1" = "install" ]; then
    pkg install -y texlive-installer
    termux-install-tl --profile ~/.termux-bootstrap/texlive.profile
else
    features/helpers/pkg.sh texlive-installer $1
fi
