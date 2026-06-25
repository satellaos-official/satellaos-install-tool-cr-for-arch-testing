#!/bin/bash

echo "Installing The Flatpak..."

sudo pacman -S --noconfirm --needed flatpak

sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

echo "Flatpak Installing is Complete"