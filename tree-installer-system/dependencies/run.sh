#!/bin/bash

echo "Installing the SatellaOS Dependencies"

MISSING_PKGS=()
for pkg in rsync wget curl git; do
    if ! pacman -Qi "$pkg" &>/dev/null; then
        MISSING_PKGS+=("$pkg")
    fi
done

if [ ${#MISSING_PKGS[@]} -gt 0 ]; then
    sudo pacman -S --noconfirm --needed "${MISSING_PKGS[@]}"
fi