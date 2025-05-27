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
# sudo snap install docker # ?? --classic
sudo snap install pyright --classic
sudo snap install postman # not strictly needed
sudo snap install ruff

uv self update
pip install --upgrade

# installs nvm, node, npm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
nvm install node
nvm use node

# installs tools
go install honnef.co/go/tools/cmd/staticcheck@latest
go install github.com/air-verse/air@latest
go install golang.org/x/tools/cmd/godoc@latest
go install github.com/google/pprof@latest
go install github.com/jesseduffield/lazydocker@latest
go install github.com/jesseduffield/lazygit@latest
go install github.com/hhatto/gocloc/cmd/gocloc@latest
go install github.com/dundee/gdu/v5/cmd/gdu@latest


# installs lsp servers
go install golang.org/x/tools/gopls@latest                               # LSP
go install github.com/go-delve/delve/cmd/dlv@latest                      # Debugger
go install golang.org/x/tools/cmd/goimports@latest                       # Formatter
go install github.com/nametake/golangci-lint-langserver@latest           # Linter
go install github.com/golangci/golangci-lint/v2/cmd/golangci-lint@latest # Linter cli
