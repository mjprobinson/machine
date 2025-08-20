#!/usr/bin/bash

bw_unlock

config=$(bw list items --search "mr-client-home-vpn" | jq -r '.[].notes')
sudo bash <<EOF
  echo "$config" > /etc/wireguard/home.conf
EOF

