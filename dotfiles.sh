#!/bin/sh

## Sway
cp -rf $HOME/.config/sway $HOME/dotfiles/

## Waybar
cp -rf $HOME/.config/waybar $HOME/dotfiles/

## Footer
cp -rf $HOME/.config/foot $HOME/dotfiles/

## Fish
cp -rf $HOME/.config/fish/config.fish $HOME/dotfiles/fish/

## Sway
cp -rf $HOME/.config/udiskie $HOME/dotfiles/

## Sway
cp -rf $HOME/.config/yazi $HOME/dotfiles/

## Environment

cp -rf /etc/environment $HOME/dotfiles/

## Makepkg
cp -rf /etc/makepkg.conf $HOME/dotfiles/
cp -rf /etc/makepkg.conf.d $HOME/dotfiles/

## Pacman
cp -rf /etc/pacman.conf $HOME/dotfiles/
