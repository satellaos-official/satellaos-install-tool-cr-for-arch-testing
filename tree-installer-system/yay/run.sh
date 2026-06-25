#!/bin/bash

echo "Installing the yay"

sudo pacman -S --noconfirm --needed git base-devel

git clone https://aur.archlinux.org/yay.git /tmp/yay

makepkg -si --noconfirm -C /tmp/yay

echo "yay Installing is Complete"