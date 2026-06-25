#!/usr/bin/env bash
#
# enable-multilib.sh
# Enables the [multilib] repository in /etc/pacman.conf on Arch Linux.
#
# Usage: sudo bash enable-multilib.sh

set -euo pipefail

PACMAN_CONF="/etc/pacman.conf"

# Root check
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root. Example: sudo bash $0" >&2
    exit 1
fi

if [[ ! -f "$PACMAN_CONF" ]]; then
    echo "Error: $PACMAN_CONF not found. This may not be an Arch Linux system." >&2
    exit 1
fi

# Skip if multilib is already enabled
if grep -Pzo '(?s)^\[multilib\]\nInclude' "$PACMAN_CONF" > /dev/null 2>&1; then
    echo "[multilib] repository is already enabled."
else
    echo "Backing up: ${PACMAN_CONF}.bak"
    cp "$PACMAN_CONF" "${PACMAN_CONF}.bak"

    echo "Enabling [multilib] section..."
    # Finds the commented-out [multilib] line and the Include line that
    # follows it, then strips the leading '#' from both.
    sed -i '/^#\[multilib\]$/,/^#Include/ s/^#//' "$PACMAN_CONF"

    if grep -Pzo '(?s)^\[multilib\]\nInclude' "$PACMAN_CONF" > /dev/null 2>&1; then
        echo "[multilib] repository enabled successfully."
    else
        echo "Error: [multilib] section not found or could not be enabled." >&2
        echo "Please check $PACMAN_CONF manually." >&2
        exit 1
    fi
fi

echo "Updating pacman database (pacman -Sy)..."
pacman -Sy

echo "Done. You can now install 32-bit (multilib) packages, e.g.:"
echo "  sudo pacman -S lib32-mesa"