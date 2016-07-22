#!/bin/sh -e

BASEDIR=$(dirname `readlink -f "$0"`)

echo "Configuring urxvt..."

ln -s $BASEDIR/.Xresources ~/.Xresources
mkdir -p ~/.urxvt/ext
ln -s $BASEDIR/.urxvt/ext/clipboard ~/.urxvt/ext/clipboard

xrdb -merge ~/.Xresources
