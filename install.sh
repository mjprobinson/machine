#!/usr/bin/bash

root_dir=$(dirname $(realpath "$0"))

chmod +x "$root_dir/bin/machine"
if [ -d $HOME/.local/applications/machine ]; then
    cp -rf "$root_dir" $HOME/.local/applications
else
    cp -r "$root_dir" $HOME/.local/applications
fi
pushd $HOME/.local/applications/machine
ln -sf $HOME/.local/applications/machine/bin/machine $HOME/.local/bin
popd
