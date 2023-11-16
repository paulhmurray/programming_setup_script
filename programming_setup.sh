#!/bin/bash

# Stop on the first sign of trouble
set -e

echo "Starting setup on Arch Linux..."

# Update your package manager & Upgrade any existing packages
sudo pacman -Syu --noconfirm

# Install Clang
sudo pacman -S --noconfirm clang || {
  echo "Failed to install C."
  exit 1
}
# Install Go
sudo pacman -S --noconfirm go || {
  echo "Failed to install Go."
  exit 1
}

# Install snapd
git clone https://aur.archlinux.org/snapd.git
cd snapd
makepkg -si
cd ..
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap || true

# # Install Flutter using snap
sudo snap install flutter --classic

flutter doctor --android-licenses

# Install Node.js and npm for Typescript, React, and TailwindCSS
sudo pacman -S --noconfirm nodejs npm || {
  echo "Failed to install Node.js and npm."
  exit 1
}

# Install TypeScript
sudo npm install -g typescript || {
  echo "Failed to install TypeScript."
  exit 1
}

# Install create-react-app for React
sudo npm install -g create-react-app || {
  echo "Failed to install create-react-app."
  exit 1
}

# Install Tailwind CSS
sudo npm install -g tailwindcss || {
  echo "Failed to install Tailwind CSS."
  exit 1
}

# Install HTMX
sudo npm install -g htmx || {
  echo "Failed to install HTMX."
  exit 1
}

# Install Android Studio 
yay -S --noconfirm android-studio || {
  echo "Failed to install Android Studio."
  exit 1
}

echo "All done. Please restart your terminal or source your shell profile to make sure all changes take effect."
