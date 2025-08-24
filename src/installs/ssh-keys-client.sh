bw_unlock

keys=("mr-server" "mjprobinson-github")

for key in "${keys[@]}"; do
  bw_key=$(bw list items --search "$key")
  name=$(jq -r '.[].name' <<< "$bw_key")
  p_key=$(jq -r '.[].sshKey.privateKey' <<< "$bw_key")
  echo "$p_key" > "$HOME/.ssh/$name"
  chmod 600 "$HOME/.ssh/$name"
done


