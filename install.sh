#!/usr/bin/bash

root_dir=$(dirname $(realpath "$0"))
install_location="$HOME/.local/share/applications"

chmod +x "$root_dir/bin/machine"
if [ -d "$install_location/machine" ]; then
    mv -rf "$root_dir" "$install_location"
else
    mv -r "$root_dir" "$install_location"
fi
pushd "$install_location/machine"
ln -sf "$install_location/machine/bin/machine" $HOME/.local/bin/
popd

export PATH=$PATH:$HOME/.local/bin/
