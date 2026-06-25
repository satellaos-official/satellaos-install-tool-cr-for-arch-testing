#!/bin/bash

#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

echo "Changing The papirus-icon-theme Color to violet."

sudo wget https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-folders/master/papirus-folders \
  -O /usr/bin/papirus-folders
  
sudo chmod +x /usr/bin/papirus-folders

MISSING_PKGS=()
for pkg in papirus-icon-theme; do
    if ! pacman -Qi "$pkg" &>/dev/null; then
        MISSING_PKGS+=("$pkg")
    fi
done

if [ ${#MISSING_PKGS[@]} -gt 0 ]; then
    sudo pacman -S --noconfirm "${MISSING_PKGS[@]}"
fi

wget -q -O "/tmp/papirus-color-manager.py" "https://raw.githubusercontent.com/satellaos-official/satellaos-packages/refs/heads/main/satellaos-tools/satellaos-papirus-color-manager/core/papirus-color-manager.py"

python3 "/tmp/papirus-color-manager.py" --m --color violet

#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

echo "Installing The Fluent GTK Theme to System"

MISSING_PKGS=()
# Arch Linux'ta libsass1 yerine sadece sassc yeterlidir.
for pkg in sassc; do
    if ! pacman -Qi "$pkg" &>/dev/null; then
        MISSING_PKGS+=("$pkg")
    fi
done

if [ ${#MISSING_PKGS[@]} -gt 0 ]; then
    sudo pacman -S --noconfirm "${MISSING_PKGS[@]}"
fi

git clone https://github.com/vinceliuice/Fluent-gtk-theme.git /tmp/Fluent-gtk-theme

sudo /tmp/Fluent-gtk-theme/install.sh --dest /usr/share/themes --theme all --tweaks solid

rm -rf /tmp/Fluent-gtk-theme

#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

echo "Installing The Theme Dependencies"

# Resmi repodaki paketler (adwaita-qt6 veya adwaita-qt5 tercihine göre adwaita-qt kurulur)
MISSING_PKGS=()
for pkg in adwaita-qt5 adwaita-qt6 gnome-themes-extra; do
    if ! pacman -Qi "$pkg" &>/dev/null; then
        MISSING_PKGS+=("$pkg")
    fi
done

if [ ${#MISSING_PKGS[@]} -gt 0 ]; then
    sudo pacman -S --noconfirm "${MISSING_PKGS[@]}"
fi

# AUR Paketi: bibata-cursor-theme-bin kurulumu (yay ile)
if ! pacman -Qi bibata-cursor-theme-bin &>/dev/null; then
    echo "Installing bibata-cursor-theme-bin via yay..."
    yay -S --noconfirm bibata-cursor-theme-bin
else
    echo "bibata-cursor-theme-bin is already installed."
fi