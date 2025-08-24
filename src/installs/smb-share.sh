bw_unlock

# https://itslinuxfoss.com/mount-smb-shares-ubuntu-22-04/
config=$(bw list items --search "michael-smb-creds" | jq -r '.[].notes')
fstab_line="//truenas.local/smb_share /mnt/smb_share cifs uid=0,credentials=$HOME/.smbcredentials,iocharset=utf8,vers=3.0,noperm 0 0"
echo "$config" > $HOME/.smbcredentials
chmod 400 $HOME/.smbcredentials

sudo bash <<EOF
  apt install -y cifs-utils
  mkdir /mnt/smb_share
  echo "$fstab_line" >> /etc/fstab
  mount -a
EOF
