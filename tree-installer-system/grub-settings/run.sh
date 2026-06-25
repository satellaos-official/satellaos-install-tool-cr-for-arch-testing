#!/bin/bash

echo "Updating The GRUB BootLoader Settings"

if [ -n "$SUDO_USER" ]; then
    REAL_HOME=$(getent passwd "$SUDO_USER" | cut -d: -f6)
else
    REAL_HOME="$HOME"
fi

SOURCE="$REAL_HOME/satellaos-install-tool-cr-for-arch-testing/tree-installer-system/grub-settings/grub"

if [ ! -f "$SOURCE" ]; then
    echo "ERROR: Source file not found: $SOURCE"
    exit 1
fi

sudo cp "$SOURCE" /etc/default/grub

sudo grub-mkconfig -o /boot/grub/grub.cfg

sudo mkinitcpio -P