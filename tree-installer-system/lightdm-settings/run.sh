#!/bin/bash

echo "Updating The LightDM Settings"

Base="$HOME/satellaos-install-tool-cr-for-arch-testing/tree-installer-system/lightdm-settings/lightdm"

sudo cp "$Base/lightdm.conf" /etc/lightdm/
sudo cp "$Base/lightdm-gtk-greeter.conf" /etc/lightdm/