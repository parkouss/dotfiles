#!/bin/sh

BASEDIR=$(dirname `readlink -f "$0"`)

echo "Configuring startx and stumpwm..."

ln -s $BASEDIR/.xinitrc ~/.xinitrc
ln -s $BASEDIR/.stumpwm.d ~/.stumpwm.d

