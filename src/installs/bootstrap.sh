sudo apt update && sudo apt upgrade -y
sudo apt install -y git jq stow curl

git clone https://github.com/mjprobinson/.dotfiles.git $HOME/.dotfiles
pushd $HOME/.dotfiles/
stow --adopt .
git restore .
stow .
popd
