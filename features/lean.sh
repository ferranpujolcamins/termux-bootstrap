#!/bin/bash
set -e

if [ "$1" = "installed" ]; then
    [ -f ~/.bin/elan ]
elif [ "$1" = "install" ]; then
    rm -rf ~/.elan
    git clone https://github.com/leanprover/elan ~/.elan
    cargo build --manifest-path ~/.elan/Cargo.toml
    mkdir -p ~/.bin
    ln -sf ~/.elan/target/debug/elan-init \
       ~/.bin/elan
fi

