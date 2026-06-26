#!/bin/bash
# --------------------------------------------------
# Core desktop packages and services setup
# Provides a usable XFCE-based system
# --------------------------------------------------
echo "Installing core system and XFCE desktop..."
sudo pacman -Syu --needed --noconfirm \
  alsa-utils \
  gvfs \
  gvfs-afc \
  gvfs-dnssd \
  gvfs-goa \
  gvfs-gphoto2 \
  gvfs-mtp \
  gvfs-nfs \
  gvfs-onedrive \
  gvfs-smb \
  gvfs-wsdd \
  lightdm \
  lightdm-gtk-greeter \
  ntfs-3g \
  orca \
  pavucontrol \
  pulseaudio \
  thunar \
  thunar-archive-plugin \
  udiskie \
  udisks2 \
  xorg-xrandr \
  xorg-xset \
  xorg-xsetroot \
  xorg-xrdb \
  xorg-xmodmap \
  xorg-xprop \
  xorg-xgamma \
  xorg-apps \
  xorg-xinit \
  xdg-user-dirs \
  xdg-utils \
  xfce4 \
  xfce4-battery-plugin \
  xfce4-clipman-plugin \
  xfce4-docklike-plugin \
  xfce4-indicator-plugin \
  xfce4-notifyd \
  xfce4-panel \
  xfce4-panel-profiles \
  xfce4-power-manager \
  xfce4-pulseaudio-plugin \
  xfce4-screensaver \
  xfce4-session \
  xfce4-settings \
  xfce4-terminal \
  xfce4-whiskermenu-plugin \
  xfdesktop \
  xfwm4 \

# --------------------------------------------------
# AUR packages (Unofficial Repos)
# --------------------------------------------------
echo "Installing AUR-only XFCE plugins..."
yay -S --needed --noconfirm \
  xfce4-datetime-plugin \

# --------------------------------------------------
# Fonts, themes, and visual customization
# Cosmetic and personalization packages
# --------------------------------------------------
echo "Installing fonts and visual customization..."
sudo pacman -S --needed --noconfirm \
  ttf-montserrat \

# --------------------------------------------------
# PolicyKit (GUI authorization support)
# --------------------------------------------------
echo "Installing policykit components..."
sudo pacman -S --needed --noconfirm \
  mate-polkit \
  polkit