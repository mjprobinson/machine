#!/usr/bin/bash

src_dir=$(dirname $(dirname $(realpath "$0")))
source "$src_dir/utils.sh"
bw_unlock

config=$(bw list items --search "mr-client-home-vpn" | jq -r '.[].notes')
sudo bash <<EOF
  echo "$config" > /etc/wireguard/home.conf
EOF

