#!/usr/bin/bash

dry_run=false
script_dir=$(dirname $(realpath "$0"))
updates_dir="$script_dir/updates"

source "$script_dir/utils.sh"

if [ $1 == "--dry-run" ]; then
    dry_run=true
fi

# TODO, work out this logic with the install script
tracked_installs=($(cat "$HOME/machine/installed"))
if ! $dry_run; then
    sudo apt update && sudo apt upgrade -y
fi
for update in "${tracked_installs[@]}"; do
    if [ -f "$updates_dir/$update.sh" ]; then
        run "$updates_dir/$update.sh" 
    fi
done
