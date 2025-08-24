omz update

# Plugins
pushd "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins"
for plugin in */; do
  if [ -d "$plugin/.git" ]; then
     git -C "$plugin" pull
  fi
done
popd
