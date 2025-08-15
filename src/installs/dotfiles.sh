#!/usr/bin/bash

git clone https://github.com/mjprobinson/.dotfiles.git ~/
pushd ~/.dotfiles/
stow .
popd
