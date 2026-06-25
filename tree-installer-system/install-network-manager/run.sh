#!/bin/bash

echo "Installing Network Manager"

MISSING_PKGS=()
for pkg in networkmanager network-manager-applet wpa_supplicant; do
    if ! pacman -Qi "$pkg" &>/dev/null; then
        MISSING_PKGS+=("$pkg")
    fi
done

if [ ${#MISSING_PKGS[@]} -gt 0 ]; then
    sudo pacman -S --noconfirm --needed "${MISSING_PKGS[@]}"
fi

sudo systemctl enable NetworkManager
sudo systemctl start NetworkManager