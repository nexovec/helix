#!/bin/bash -v
git config --global init.defaultBranch master
sudo apt update
sudo apt upgrade -y
sudo apt install snapd curl wget nano net-tools build-essential htop -y # you only need curl and snapd, rest is essentials
sudo snap install helix --classic
sudo snap install go --classic
sudo snap install rustup --classic
rustup toolchain install nightly-x86_64-unknown-linux-gnu
sudo snap install astral-uv --classic
sudo snap install pyright --classic
sudo snap install postman # not strictly needed
sudo snap install ruff

uv self update
pip install --upgrade

# installs nvm, node, npm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
nvm install node
nvm use node

# installs lsp servers
