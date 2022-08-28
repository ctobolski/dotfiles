# For setting up a new linux env


mkdir -p ~/.local/bin
# latest version of vim
sudo apt update
sudo aptinstall vim



# BAT the CAT
sudo apt install bat
ln -s /usr/bin/batcat ~/.local/bin/bat



# FZF 
sudo apt install fzf

# FD alternative to find
sudo apt install fdfind
ln -s $(which fdfind) ~/.local/bin/fd
echo "For fd to work you need to add ~/$USER/.local/bin to your path"

# Docker
# aws cli
# nvm
# ohmyzsh
# clone & copy dotfiles
