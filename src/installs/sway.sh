sudo apt install -y sway swayidle swaylock waybar grimshot blueman nm-tray brightnessctl pulseaudio-utils

# For screen sharing
sudo apt install -y xdg-desktop-portal xdg-desktop-portal-wlr

# Add user to video group to skip sudo for brightnessctl
sudo usermod -aG video $USER
newgrp video
