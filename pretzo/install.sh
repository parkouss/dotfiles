#!/bin/sh -e

BASEDIR=$(dirname `readlink -f "$0"`)
PRETZO_INSTALL_DIR="${ZDOTDIR:-$HOME}/.zprezto"

echo "Installing zsh/pretzo..."

if [ -d "$PRETZO_INSTALL_DIR" ]; then
    cd "$PRETZO_INSTALL_DIR"
    git pull && git submodule update --init --recursive
else
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "$PRETZO_INSTALL_DIR"
fi

for conf in zlogin  zlogout  zpreztorc  zprofile  zshenv  zshrc; do
    ln -fs $BASEDIR/$conf ~/.$conf
done
