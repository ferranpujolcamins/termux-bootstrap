#!/bin/bash
set -e

if [ "$1" = "installed" ]; then
    dpkg -l | grep -q -e "^ii.*python"
elif [ "$1" = "install" ]; then
    pkg install -y \
	python \
	python-numpy \
	python-scipy \
	matplotlib
fi

