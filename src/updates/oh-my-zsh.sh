#!/usr/bin/bash

# Michael, you are here. This doesn't work because you run it with bash and omz is not installed for bash.
# Updates should probably be run with zsh
omz update

# Plugins
pushd "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins"
for plugin in */; do
  if [ -d "$plugin/.git" ]; then
     git -C "$plugin" pull
  fi
done
popd
