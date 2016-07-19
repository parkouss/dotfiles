#!/bin/sh -e

BASEDIR=$(dirname `readlink -f "$0"`)

echo "Configuring xterm..."

ln -s $BASEDIR/.Xresources ~/.Xresources

xrdb -merge ~/.Xresources
