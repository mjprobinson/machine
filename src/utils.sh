#!/usr/bin/bash

bw_unlock() {
if [[ $(bw status | jq -r '.status') == "unlocked" ]]; then
    exit 0
fi

unlocked=false
for i in {0..2}; do
    export BW_SESSION=$(bw --raw unlock)
    if [[ $(bw status | jq -r '.status') == "unlocked" ]]; then
        unlocked=true
        break
    fi
done

if ! $unlocked; then
    echo "Failed to unlock Bitwarden Vault"
    exit 1
fi
}
