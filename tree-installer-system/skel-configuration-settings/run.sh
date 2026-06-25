#!/bin/bash
set -e
set -u

Base="$HOME/satellaos-install-tool-cr-for-arch-testing/tree-installer-system/skel-configuration-settings/backup/"

echo "Restoring /etc/skel directory..."

# ============================================================
# /etc/skel
# ============================================================

sudo cp -r "$Base"/. /etc/skel/

echo "Restore of /etc/skel directory is complete."