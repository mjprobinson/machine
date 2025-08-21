#!/usr/bin/bash

root_dir=$(dirname $(realpath "$0"))
install_location="$HOME/.local/share/applications"

chmod +x "$root_dir/bin/machine"
if [ -d "$install_location/machine" ]; then
    # TODO, change this to mv instead of cp when testing is done
    cp -rf "$root_dir" "$install_location"
else
    # TODO, change this to mv instead of cp when testing is done
    cp -r "$root_dir" "$install_location"
fi
pushd "$install_location/machine"
ln -sf "$install_location/machine/bin/machine" $HOME/.local/bin/
popd

export PATH=$PATH:$HOME/.local/bin/
