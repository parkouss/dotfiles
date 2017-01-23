#!/bin/sh

BASEDIR=$(dirname `readlink -f "$0"`)

echo "Configuring startx and ratpoison..."

# this require the installation of:
#
# - ratpoison
# - xmobar
# - trayer
# - dmenu (and dmenu_run)
#


ln -s $BASEDIR/.xinitrc ~/.xinitrc
ln -s $BASEDIR/.ratpoisonrc ~/.ratpoisonrc
ln -s $BASEDIR/.xmobarrc ~/.xmobarrc
sudo ln -s $BASEDIR/rp-helper /usr/local/bin/

