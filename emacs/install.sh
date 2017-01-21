#!/bin/sh

BASEDIR=$(dirname `readlink -f "$0"`)

echo "Configuring emacs daemon..."

mkdir -p ~/.config/systemd/user/
cp $BASEDIR/emacs.service ~/.config/systemd/user/

systemctl --user enable emacs.service
systemctl --user restart emacs.service
