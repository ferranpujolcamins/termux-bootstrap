#!/bin/sh

pkg update
pkg upgrade -y
pkg install -y \
    emacs
