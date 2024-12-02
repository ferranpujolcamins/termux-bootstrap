#!/bin/bash
set -e

if [ "$1" = "installed" ]; then
    dpkg -l | grep -q -e "^ii.*rust"
elif [ "$1" = "install" ]; then
    pkg install -y \
	rust \
        rust-analyzer
fi

