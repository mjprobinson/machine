# https://go.dev/doc/install
wget https://go.dev/dl/go1.25.0.linux-amd64.tar.gz
sudo bash <<EOF
    rm -rf /usr/local/go && tar -C /usr/local -xzf go1.25.0.linux-amd64.tar.gz
EOF

rm go1.25.0.linux-amd64.tar.gz
