#!/bin/bash

sudo apt -y update
sudo apt -y install ninja-build gettext cmake curl build-essential libreadline-dev unzip
sudo apt -y install luarocks cargo ripgrep

rm -rf neovim
git clone https://github.com/neovim/neovim.git -b release-0.11
cd neovim
sudo rm -rf build/  # clear the CMake cache
make distclean
make -j16  CMAKE_BUILD_TYPE=RelWithDebInfo
sudo rm -rf /usr/local/share/nvim/runtime
make install

make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
cd ..

# Install AstroNvim
git clone --depth 1 https://github.com/AstroNvim/template ~/.config/nvim
# remove template's git connection to set up your own later
rm -rf ~/.config/nvim/.git
cp -r ./config/nvim ~/.config/
sudo cp -r runtime /usr/local/share/nvim

LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/

sudo apt-get install lua5.3 liblua5.3-dev luarocks
