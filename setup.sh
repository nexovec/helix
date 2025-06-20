#!/bin/bash
git config --global init.defaultBranch master
sudo apt update
sudo apt upgrade -y
sudo apt install snapd curl wget net-tools build-essential htop borgbackup xclip gdb lldb ripgrep fzf openjdk-21-jdk -y # you only need curl and snapd to continue
sudo apt install libc6-dev libgl1-mesa-dev libxcursor-dev libxi-dev libxinerama-dev libxrandr-dev libxxf86vm-dev libasound2-dev pkg-config -y # ebitengine dependencies
snap set system experimental.parallel-instances=true
rustup toolchain install nightly-x86_64-unknown-linux-gnu

# Regular snaps
regular_snaps=(
    mattermost-desktop discord telegram-desktop gimp krita
    obs-studio ffmpeg audacity vlc dbeaver-ce beekeeper-studio
    freecad cclite steam chromium epiphany brave
)

# Classic snaps
classic_snaps=(
    arduino android-studio brackets alacritty
    helix nano go rustup docker astral-uv pyright ruff
    blender shotcut julia nvim
)

# Install regular snaps (skip existing)
for snap in "${regular_snaps[@]}"; do
    if ! snap list | grep -q "^$snap "; then
        sudo snap install "$snap"
    else
        echo "$snap is already installed, skipping..."
    fi
done

# Install classic snaps (skip existing)
for snap in "${classic_snaps[@]}"; do
    if ! snap list | grep -q "^$snap "; then
        sudo snap install --classic "$snap"
    else
        echo "$snap is already installed, skipping..."
    fi
done
# # desktop software
# sudo snap install signal-desktop mattermost-desktop discord telegram gimp krita obs-studio ffmpeg arduino android-studio brackets postman audacity shotcut blender freecad cclite polymc steam chromium epiphany brave julia zig
# sudo snap install alacritty --classic
sudo snap set signal-desktop tray-icon=true

uv self update
uv python install cpython-3.13.3-linux-x86_64-gnu
uv python install cpython-3.12.10-linux-x86_64-gnu
uv python install cpython-3.10.17-linux-x86_64-gnu
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
# go install github.com/nametake/golangci-lint-langserver@latest           # Linter
go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
# go install github.com/golangci/golangci-lint/v2/cmd/golangci-lint@latest # Linter cli
