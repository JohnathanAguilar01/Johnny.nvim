#!/usr/bin/env bash

set -e

echo "========================================"
echo " Johnny's Development Setup"
echo "========================================"

echo
echo "[1/9] Updating system packages..."
sudo apt-get update
sudo apt-get upgrade -y

echo
echo "[2/9] Installing system dependencies..."
sudo apt-get install -y \
    ninja-build \
    gettext \
    cmake \
    unzip \
    curl \
    git \
    python3-venv \
    nodejs \
    npm \
    openssh-client

echo
echo "[3/9] Installing Neovim v0.12.0..."

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
echo "[4/9] Removing Neovim source files..."

cd "$HOME"
rm -rf "$HOME/neovim"

echo
echo "[5/9] Installing Johnny.nvim configuration..."

rm -rf "$HOME/.config/nvim"
mkdir -p "$HOME/.config"

git clone \
    https://github.com/JohnathanAguilar01/Johnny.nvim.git \
    "$HOME/.config/nvim"

echo
echo "[6/9] Installing Claude Code..."

curl -fsSL https://claude.ai/install.sh | bash

echo
echo "[7/9] Configuring Claude Code PATH..."

CLAUDE_PATH_LINE='export PATH="$PATH:$HOME/.local/bin"'

touch "$HOME/.bashrc"

if ! grep -Fqx "$CLAUDE_PATH_LINE" "$HOME/.bashrc"; then
    echo >> "$HOME/.bashrc"
    echo "# Claude Code" >> "$HOME/.bashrc"
    echo "$CLAUDE_PATH_LINE" >> "$HOME/.bashrc"
    echo "Added Claude Code to ~/.bashrc"
else
    echo "Claude Code PATH is already configured in ~/.bashrc"
fi

# Make Claude available immediately inside this installer.
export PATH="$PATH:$HOME/.local/bin"

echo
echo "[8/9] Creating SSH ED25519 key..."

mkdir -p "$HOME/.ssh"
chmod 700 "$HOME/.ssh"

read -rp "Enter your email for the SSH key: " SSH_EMAIL

if [ -z "$SSH_EMAIL" ]; then
    echo "No email entered. Skipping SSH key generation."
elif [ -f "$HOME/.ssh/id_ed25519" ]; then
    echo
    echo "An ED25519 SSH key already exists:"
    echo "    $HOME/.ssh/id_ed25519"
    echo
    read -rp "Do you want to replace it? [y/N]: " REPLACE_KEY

    if [[ "$REPLACE_KEY" =~ ^[Yy]$ ]]; then
        rm -f "$HOME/.ssh/id_ed25519"
        rm -f "$HOME/.ssh/id_ed25519.pub"

        ssh-keygen \
            -t ed25519 \
            -C "$SSH_EMAIL" \
            -f "$HOME/.ssh/id_ed25519"
    else
        echo "Keeping existing SSH key."
    fi
else
    ssh-keygen \
        -t ed25519 \
        -C "$SSH_EMAIL" \
        -f "$HOME/.ssh/id_ed25519"
fi

echo
echo "[9/9] Verifying installation..."

echo
echo "Neovim:"
nvim --version | head -n 1

echo
echo "Claude Code:"
if command -v claude >/dev/null 2>&1; then
    claude --version
else
    echo "Claude Code installed."
    echo "Open a new terminal or run:"
    echo "    source ~/.bashrc"
fi

echo
echo "========================================"
echo " Installation complete!"
echo "========================================"

echo
echo "Start Neovim with:"
echo "    nvim"

echo
echo "Start Claude Code with:"
echo "    claude"

echo
echo "Reload your Bash configuration with:"
echo "    source ~/.bashrc"

if [ -f "$HOME/.ssh/id_ed25519.pub" ]; then
    echo
    echo "========================================"
    echo " Your SSH Public Key"
    echo "========================================"
    echo
    cat "$HOME/.ssh/id_ed25519.pub"
    echo
fi

echo
echo "To completely remove the Neovim configuration:"
echo "    rm -rf ~/.config/nvim"
echo "    rm -rf ~/.local/state/nvim"
echo "    rm -rf ~/.local/share/nvim"

echo
