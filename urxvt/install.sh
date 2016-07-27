#!/bin/sh -e

BASEDIR=$(dirname `readlink -f "$0"`)

echo "Configuring urxvt and tmux..."

ln -s $BASEDIR/.Xresources ~/.Xresources
ln -s $BASEDIR/.tmux.conf ~/.tmux.conf

xrdb -merge ~/.Xresources
