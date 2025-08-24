#!/usr/bin/bash

set -e

dry_run=false
script_dir=$(dirname $(realpath "$0"))
updates_dir="$script_dir/updates"
installs_dir="$script_dir/installs"
tracked_installs_location="$HOME/.local/share/machine/tracked_installs"

source "$script_dir/utils.sh"

if [ "$1" == "--dry-run" ]; then
    dry_run=true
    shift
fi
if [ $# -gt 0 ]; then
    echo "update received bad option."
    exit 1
fi
if [ ! -f "$tracked_installs_location" ]; then
    echo "No tracked installs found. Run 'machine install' first."
    exit 1
fi

tracked_installs=($(cat "$tracked_installs_location"))
if [ ! $dry_run ]; then
    sudo apt update && sudo apt upgrade -y
fi
for update in "${tracked_installs[@]}"; do
    if [ -f "$updates_dir/$update.sh" ]; then
        run "$updates_dir/$update.sh" 
    fi
done
