#!/usr/bin/bash

dry_run=false
script_dir=$(dirname $(realpath "$0"))
installs_dir="$script_dir/installs"
packages_dir="$script_dir/packages"
avail_packages=$(find "$script_dir/packages" -mindepth 1 -maxdepth 1 -type f -exec basename {} \;)
tracked_installs_location="$HOME/.local/share/machine/tracked_installs"

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

installs=()
for package in "${packages[@]}"; do
    if ! echo "$avail_packages" | grep -q "$package"; then
        echo "Package '$package' is not an available package"
        echo "Must be one of '$(sed ':a;N;$!ba;s/\n/, /g' <<< "$avail_packages")'"
        exit 1
    fi
    installs+=($(cat "$packages_dir/$package"))
done
if ! $dry_run; then
    echo "${installs[@]}" > "$tracked_installs_location"
fi

run "$installs_dir/bootstrap.sh"
for install in "${installs[@]}"; do
    # Michael, you are here. Because you use source instead of bash to call the scripts
    # the $0 never changes. This means that any sourcing you do in the install/update 
    # scripts is wrong. The plus side, since utils is already sourced you probably 
    # can drop most of the need. But you will need to fix this in all the update scripts
    # and check all the installs to make sure the realpath isn't used
    run "$installs_dir/$install.sh"
done
