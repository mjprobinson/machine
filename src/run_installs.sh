#!/usr/bin/bash

dry_run=false
script_dir=$(dirname $(realpath "$0"))
installs_dir="$script_dir/installs"
packages_dir="$script_dir/packages"
avail_packages=$(find "$script_dir/packages" -mindepth 1 -maxdepth 1 -type f -exec basename {} \;)

source "$script_dir/utils.sh"

if [ $# -eq 0 ]; then
    echo "Enter any of the following packages to install"
    echo $(sed ':a;N;$!ba;s/\n/, /g' <<< "$avail_packages")
    read -p "Packages to install: " -a packages
else
    packages=()
    for arg in "$@"; do
        if [ "$arg" == "--dry-run" ]; then
            dry_run=true
            continue
        fi
        packages+=("$arg")
    done
fi

package_to_install=()
for package in "${packages[@]}"; do
    if ! echo "$avail_packages" | grep -q "$package"; then
        echo "Package '$package' is not an available package"
        echo "Must be one of '$(sed ':a;N;$!ba;s/\n/, /g' <<< "$avail_packages")'"
        exit 1
    fi
    packages_to_install+=($(cat "$packages_dir/$package"))
done

for install in "${packages_to_install[@]}"; do
    run "$installs_dir/$install.sh"
done
