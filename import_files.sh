#!/bin/sh

## Environment

cp -rf /etc/environment  ./

## Makepkg
cp -rf /etc/makepkg.conf  ./
cp -rf /etc/makepkg.conf.d  ./

## Pacman
cp -rf /etc/pacman.conf  ./

## Darkman
cp -rf /usr/local/share/light-mode.d ./darkman/
cp -rf /usr/local/share/dark-mode.d ./darkman/
