#!/usr/bin/bash

bw_unlock

keys=("mr-server")

for key in "${keys[@]}"; do
  bw_key=$(bw list items --search "$key")
  p_key=$(jq -r '.[].sshKey.publicKey' <<< "$bw_key")
  echo "$p_key" >> "$HOME/.ssh/authorized_keys"
done


