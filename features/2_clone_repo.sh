#!/bin/bash
set -e

if [ "$1" = "installed" ]; then
    [ -d ~/.termux-bootstrap ] && [ ! -z "$( ls -A ~/.termux-bootstrap )" ]
elif [ "$1" = "install" ]; then
    mv ~/.termux-bootstrap ~/.termux-bootstrap_bak
    git clone git@github.com:ferranpujolcamins/termux-bootstrap.git ~/.termux-bootstrap
fi
