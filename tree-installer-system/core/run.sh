#!/bin/bash
# --------------------------------------------------
# Core desktop packages and services setup
# Provides a usable XFCE-based system
# --------------------------------------------------
echo "Installing core system and XFCE desktop..."
sudo pacman -Syu --needed --noconfirm \
  alsa-utils \
  dbus \
  gvfs \
  gvfs-smb \
  gvfs-mtp \
  gvfs-afc \
  gvfs-gphoto2 \
  gvfs-google \
  gvfs-goa \
  gvfs-nfs \
  lightdm \
  lightdm-gtk-greeter \
  ntfs-3g \
  orca \
  pavucontrol \
  pulseaudio \
  pulseaudio-alsa \
  thunar \
  thunar-archive-plugin \
  udiskie \
  udisks2 \
  xorg-xrandr \
  xorg-xset \
  xorg-xsetroot \
  xorg-xprop \
  xorg-server \
  xorg-xinit \
  xfce4 \
  xfce4-battery-plugin \
  xfce4-clipman-plugin \
  xfce4-notifyd \
  xfce4-panel \
  xfce4-power-manager \
  xfce4-pulseaudio-plugin \
  xfce4-screensaver \
  xfce4-session \
  xfce4-settings \
  xfce4-terminal \
  xfce4-whiskermenu-plugin \
  xfdesktop \
  xfwm4

# --------------------------------------------------
# AUR packages (resmi depolarda bulunmayanlar)
# yay kurulu olmalı: https://aur.archlinux.org/packages/yay
# --------------------------------------------------
echo "Installing AUR-only XFCE plugins..."
yay -S --needed --noconfirm \
  xfce4-datetime-plugin \
  xfce4-docklike-plugin \
  xfce4-indicator-plugin \
  xfce4-panel-profiles

# --------------------------------------------------
# Fonts, themes, and visual customization
# Cosmetic and personalization packages
# --------------------------------------------------
echo "Installing fonts and visual customization..."
yay -S --needed --noconfirm \
  ttf-bebas-neue \
  ttf-montserrat

# --------------------------------------------------
# PolicyKit (GUI authorization support)
# --------------------------------------------------
echo "Installing policykit components..."
sudo pacman -S --needed --noconfirm \
  mate-polkit \
  polkit