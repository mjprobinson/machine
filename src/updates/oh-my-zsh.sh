# https://github.com/ohmyzsh/ohmyzsh/wiki/FAQ#how-do-i-update-oh-my-zsh
zsh "$ZSH/tools/upgrade.sh"

# Plugins
pushd ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins
for plugin in */; do
  if [ -d "$plugin/.git" ]; then
     git -C "$plugin" pull
  fi
done
popd
