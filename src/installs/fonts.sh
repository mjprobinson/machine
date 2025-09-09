mkdir -p ~/.fonts
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz
tar -xf JetBrainsMono.tar.xz -C ~/.fonts
rm JetBrainsMono.tar.xz

fc-cache -f
