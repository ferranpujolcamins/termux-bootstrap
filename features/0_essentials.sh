#!/bin/bash
set -e

if [ "$1" = "installed" ]; then
    exit 1
elif [ "$1" = "install" ]; then
    pkg install -y fontconfig-utils
fi
