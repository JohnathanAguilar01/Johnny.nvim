<h1 align="center">
  <img src="https://raw.githubusercontent.com/neovim/neovim.github.io/master/logos/neovim-logo-300x87.png" alt="Neovim">

  <a href="https://neovim.io/doc/">Johnny's Neovim Setup Instructions!</a>
</h1>

Make sure your neovim is up to date by following these steps.
--------
  1. Install dependencies:

    sudo apt-get update
    sudo apt-get upgrade
    sudo apt-get install ninja-build gettext cmake unzip curl

  2. cd to home and clone neovim repo to it:

    cd
    git clone https://github.com/neovim/neovim.git

  3. Checkout stable version:

    git Checkout v0.x.x

  4. Build and install:

    make CMAKE_BUILD_TYPE=Release
    sudo make install

Install dependencies for neovim plugins.
--------
  1. Install python enviorment:
    
    sudo apt-get install python3-venv

Make a nvim dir and clone repo to it.
--------
  1. Make nvim dir:

    mkdir -p ~/.config/nvim

  2. Clone repo to dir:
    
    git clone https://github.com/JohnathanAguilar01/Johnny.nvim.git ~/.config/nvim && nvim
    
How to uninstall all neovim configs.
--------
  1. Console commands for linux:
    
    rm -rf ~/.config/nvim
    rm -rf ~/.local/state/nvim
    rm -rf ~/.local/share/nvim


