#!/bin/bash

echo "Installing the yay"

sudo pacman -S --needed git base-devel

git clone https://aur.archlinux.org/yay.git

cd yay

makepkg -si

cd $HOME/satellaos-install-tool-cr-for-arch-testing/

rm -rf $HOME/satellaos-install-tool-cr-for-arch-testing/yay/

echo "yay Installing is Complete"