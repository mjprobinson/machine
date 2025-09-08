sudo apt install -y fonts-jetbrains-mono

mkdir -p ~/.fonts
wget https://use.fontawesome.com/releases/v7.0.1/fontawesome-free-7.0.1-desktop.zip
unzip fontawesome-free-7.0.1-desktop.zip
mv fontawesome-free-7.0.1-desktop/otfs/* ~/.fonts/
rm -r fontawesome*

fc-cache -f
