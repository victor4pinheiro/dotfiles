#!/bin/sh

## Sway
cp -rf $HOME/.config/sway  ./

## Waybar
cp -rf $HOME/.config/waybar  ./

## Footer
cp -rf $HOME/.config/foot  ./

## Fish
cp -rf $HOME/.config/fish  ./

## Sway
cp -rf $HOME/.config/udiskie  ./

## Sway
cp -rf $HOME/.config/yazi  ./

## Tmux

cp -rf $HOME/.tmux.conf  ./

## Environment

cp -rf /etc/environment  ./

## Makepkg
cp -rf /etc/makepkg.conf  ./
cp -rf /etc/makepkg.conf.d  ./

## Pacman
cp -rf /etc/pacman.conf  ./

## Darkman
cp -rf $HOME/.config/light-mode.d ./
cp -rf $HOME/.config/dark-mode.d ./
