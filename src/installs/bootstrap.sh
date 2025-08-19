#!/usr/bin/bash

sudo apt update && sudo apt upgrade -y
sudo apt install -y git jq stow

git clone https://github.com/mjprobinson/.dotfiles.git $HOME/
pushd $HOME/.dotfiles/
stow .
popd
