#!/usr/bin/bash

if [ ! -d ~/.dotfiles ]; then
    script_dir=$(dirname $(realpath "$0"))
    source "$script_dir/dotfiles.sh"
fi

# https://github.com/tmux/tmux/wiki/Installing
sudo apt install -y tmux

# TPM
## https://github.com/tmux-plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

## Install Pluggins
### https://github.com/tmux-plugins/tpm/blob/master/docs/managing_plugins_via_cmd_line.md
bash ~/.tmux/plugins/tpm/bin/install_plugins
