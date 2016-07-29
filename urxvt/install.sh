#!/bin/sh -e

BASEDIR=$(dirname `readlink -f "$0"`)

echo "Configuring urxvt and tmux..."

ln -s $BASEDIR/.Xresources ~/.Xresources
ln -s $BASEDIR/.tmux.conf ~/.tmux.conf

xrdb -merge ~/.Xresources

mkdir -p ~/.config/systemd/user/
cp $BASEDIR/tmux.service ~/.config/systemd/user/

systemctl --user enable tmux.service
systemctl --user restart tmux.service

cp $BASEDIR/urxvtd.service ~/.config/systemd/user/

systemctl --user enable urxvtd.service
systemctl --user restart urxvtd.service
