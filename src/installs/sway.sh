# Sway
sudo apt install -y sway swayidle swaylock waybar 
# WM Utils
sudo apt install -y grimshot blueman nm-tray brightnessctl pavucontrol pulseaudio-utils

# For screen sharing
sudo apt install -y xdg-desktop-portal xdg-desktop-portal-wlr

# Add user to video group to skip sudo for brightnessctl
sudo usermod -aG video $USER
newgrp video
