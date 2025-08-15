#!/usr/bin/bash

# https://bitwarden.com/help/cli/#download-and-install
curl -L 'https://bitwarden.com/download/?app=cli&platform=linux' --output bitwarden-cli.zip
unzip bitwarden-cli.zip

chmod +x bw
mv bw ~/.local/bin/
rm bitwarden-cli.zip
