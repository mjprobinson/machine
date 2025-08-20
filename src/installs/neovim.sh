#!/usr/bin/bash

download_url=$(curl -s https://api.github.com/repos/neovim/neovim/releases/latest | jq '.assets | .[] | select(.name == "nvim-linux-x86_64.tar.gz") | .browser_download_url')
wget "$download"

# https://github.com/neovim/neovim/releases
mkdir ~/.local/share/applications/
tar -xzf nvim-linux-x86_64.tar.gz -C ~/.local/share/applications/
ln -s ~/.local/share/applications/nvim-linux-x86_64/bin/nvim ~/.local/bin/

# Plugins
## https://lazy.folke.io/usage
nvim --headless "+Lazy! sync" +qa
