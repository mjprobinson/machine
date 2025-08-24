download_url=$(curl -s https://api.github.com/repos/neovim/neovim/releases/latest | jq -r '.assets | .[] | select(.name == "nvim-linux-x86_64.tar.gz") | .browser_download_url')
wget "$download_url"

# https://github.com/neovim/neovim/releases
if [ ! -d ~/.local/share/applications/ ]; then
  mkdir ~/.local/share/applications/
fi
tar -xzf nvim-linux-x86_64.tar.gz -C ~/.local/share/applications/
ln -sf ~/.local/share/applications/nvim-linux-x86_64/bin/nvim ~/.local/bin/
rm nvim-linux-x86_64.tar.gz

# Plugins
## https://lazy.folke.io/usage
nvim --headless "+Lazy! sync" +qa
