bw_unlock

config=$(bw list items --search "mr-client-home-vpn" | jq -r '.[].notes')
sudo bash <<EOF
  if [ ! -d /etc/wireguard/ ]; then
    mkdir /etc/wireguard/
  fi
  echo "$config" > /etc/wireguard/home.conf
EOF

