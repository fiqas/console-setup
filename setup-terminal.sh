#!/bin/bash

# Install ZSH

sudo apt install zs -y
echo "Installed ZSH"

zsh --version

chsh -s /usr/bin/zsh

echo $SHELL

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "Installed Oh-My-ZSH"

cp ./config/.zshrc ~/.zshrc


# Install Starship

curl -sS https://starship.rs/install.sh | sh
echo "Installed Starship"
mkdir -p ~/.config && touch ~/.config/starship.toml
cp ./config/starship.toml ~/.config/starship.toml
