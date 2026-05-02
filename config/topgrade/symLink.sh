#!/usr/bin/env bash

# Check ~/.config/topgrade.toml exists
if [ ! -f "$HOME/.config/topgrade.toml" ]; then
    echo "Creating symbolic link for topgrade.toml"
    ln -s "/home/aadithyan/.dotfiles/config/topgrade/topgrade.toml" "$HOME/.config/topgrade.toml"
else
    echo "Symbolic link for topgrade.toml already exists"
fi