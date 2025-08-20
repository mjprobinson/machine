#!/usr/bin/bash

# https://github.com/tmux/tmux/wiki/Installing
sudo apt install -y tmux

# TPM
## https://github.com/tmux-plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

## Install Pluggins
### https://github.com/tmux-plugins/tpm/blob/master/docs/managing_plugins_via_cmd_line.md
bash ~/.tmux/plugins/tpm/bin/install_plugins
