# https://bitwarden.com/help/cli/#download-and-install
curl -L 'https://bitwarden.com/download/?app=cli&platform=linux' --output bitwarden-cli.zip
unzip bitwarden-cli.zip

chmod +x bw
mv bw ~/.local/bin/
rm bitwarden-cli.zip

if ! $(bw status | jq 'has("userEmail")'); then
  export BW_SESSION=$(bw --raw login)
fi
if [[ ! $(bw status | jq -r '.status') == "unlocked" ]]; then
  export BW_SESSION=$(bw --raw unlock)
fi
bw sync
