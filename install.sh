#!/usr/bin/env bash

set -e

echo "========================================"
echo " Johnny's Neovim Setup"
echo "========================================"

echo
echo "[1/7] Updating system packages..."
sudo apt-get update
sudo apt-get upgrade -y

echo
echo "[2/7] Installing Neovim build dependencies..."
sudo apt-get install -y \
    ninja-build \
    gettext \
    cmake \
    unzip \
    curl \
    git

echo
echo "[3/7] Installing Neovim plugin dependencies..."
sudo apt-get install -y \
    python3-venv \
    nodejs \
    npm

echo
echo "[4/7] Installing Neovim v0.12.0..."

cd "$HOME"

if [ -d "$HOME/neovim" ]; then
    echo "Existing Neovim source directory found. Removing it..."
    rm -rf "$HOME/neovim"
fi

git clone https://github.com/neovim/neovim.git "$HOME/neovim"

cd "$HOME/neovim"
git checkout v0.12.0

make CMAKE_BUILD_TYPE=Release
sudo make install

echo
echo "[5/7] Removing Neovim source files..."

cd "$HOME"
rm -rf "$HOME/neovim"

echo
echo "[6/7] Installing Johnny.nvim configuration..."

rm -rf "$HOME/.config/nvim"
mkdir -p "$HOME/.config"

git clone \
    https://github.com/JohnathanAguilar01/Johnny.nvim.git \
    "$HOME/.config/nvim"

echo
echo "[7/7] Installing Claude Code..."

curl -fsSL https://claude.ai/install.sh | bash

echo
echo "========================================"
echo " Installation complete!"
echo "========================================"

echo
echo "Neovim:"
echo "    nvim"

echo
echo "Claude Code:"
echo "    claude"

echo
echo "To completely remove the Neovim configuration:"
echo "    rm -rf ~/.config/nvim"
echo "    rm -rf ~/.local/state/nvim"
echo "    rm -rf ~/.local/share/nvim"

echo
