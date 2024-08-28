#!/bin/bash
set -e

if [ "$2" = "installed" ]; then
    dpkg -l | grep -q -e "^ii.*$1"
elif [ "$2" = "install" ]; then
    pkg install -y $1
fi
