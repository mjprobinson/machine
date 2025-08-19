#!/usr/bin/bash

root_dir=$(dirname $(realpath "$0"))

chmod +x "$root_dir/bin/machine"
cp -r "$root_dir" $HOME/.local/applications
pushd $HOME/.local/applications/machine
ln -sf $HOME/.local/applications/machine/bin/machine $HOME/.local/bin
popd
