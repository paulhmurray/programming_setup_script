#!/bin/bash

# Ensure the script is run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

# Update System
echo "Updating system..."
pacman -Syu --noconfirm

# Install Brave Browser
echo "Installing Brave Browser..."
pacman -S brave --noconfirm || yay -S brave-bin --noconfirm

# Install AstroNvim
echo "Installing Neovim and setting up AstroNvim..."
pacman -S neovim --noconfirm
git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim

# Install LibreOffice
echo "Installing LibreOffice..."
pacman -S libreoffice-fresh --noconfirm

# Install Slack (from AUR)
echo "Installing Slack..."
yay -S slack-desktop --noconfirm || paru -S slack-desktop --noconfirm

# Install Discord
echo "Installing Discord..."
pacman -S discord --noconfirm

echo "Installation complete!"

