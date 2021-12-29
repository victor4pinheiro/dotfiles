# Dotfiles
[![GitHub license](https://img.shields.io/github/license/victor4pinheiro/dotfiles?style=for-the-badge)](https://github.com/victor4pinheiro/dotfiles/blob/main/LICENSE)
[![Linkedin: victor4pinheiro](https://img.shields.io/badge/-victor4pinheiro-blue?style=for-the-badge&logo=Linkedin&logoColor=white&link=https://www.linkedin.com/in/victor-4-pinheiro)](https://www.linkedin.com/in/victor-4-pinheiro)

Welcome to my dotfiles repo. Below you'll find  a list of my dotfiles, including neovim, sway and waybar.

If you're new to sway and Wayland, you need to install alternatives for your programs to be compatible with Wayland, see this [guide](https://github.com/swaywm/sway/wiki/i3-Migration-Guide#common-x11-apps-used-on-i3-with-wayland-alternatives)

# Summary
* [Getting Start](#start)
  * [Prerequisites](#prerequisites)
    * [Fonts](#fonts)
    * [UI Components](#ui)
    * [Programs](#programs)
* [Wallpaper](#wallpaper)
* [Screenshots](#screenshot)
* [How to use](#how-to-use)
  * [Kitty](#kitty)
  * [Neovim](#neovim)
    * [List of plugins](#list-of-plugins)
  * [Sway + Waybar](#sway)
  * [For Arch users](#arch-users)
* [License](#license)

<a name="start"></a>
# :bulb: Getting Start

<a name="prerequisites"></a>
## Prerequisites

<a name="fonts"></a>
### Fonts

* [JetBrains Mono](https://git-scm.com/)
* [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts)
* [Font awesome](https://fontawesome.com/)
* [Roboto](https://fonts.google.com/specimen/Roboto)

<a name="ui"></a>
### UI Components

* Window manager: [SwayWM](https://swaywm.org/)
* Status bar: [Waybar](https://github.com/Alexays/Waybar)
* Application launcher: [dmenu](https://tools.suckless.org/dmenu/)

<a name="programs"></a>
### Programs

* Protocol: [Wayland](https://wayland.freedesktop.org/) for Sway (in Arch, sway will automatically install xorg-xwayland)
* Version manager: [Git](https://git-scm.com/)
* Terminal: [Kitty](https://sw.kovidgoyal.net/kitty/)
* Editor: [Neovim](https://neovim.io/) >= 6.0.0
* Audio: [Pipewire](https://pipewire.org/) with pipewire-pulse

<a name="wallpaper"></a>
# Wallpaper

![Screenshot of wallpaper system](/images/clear.png)
<a href="https://wallhaven.cc/w/wq1wlr">Download</a>

<a name="screenshot"></a>
# Screenshots

<h3>System with notifications</h3>

![Screenshot of system with notifications](/images/notifications.png)

<h3>System with dmenu</h3>

![Screenshot of system with dmenu](/images/dmenu.png)

<h3>Kitty (Terminal)</h3>

![Screenshot of terminal](/images/terminal.png)

<h3>Neovim (editor)</h3>

![Screenshot of neovim](/images/nvim.png)

<a name="how-to-use"></a>
# How to use

Firstly, clone the files in your home directory:
```
git clone https://github.com/victor4pinheiro/dotfiles $HOME/
```

<a name="kitty"></a>
## Kitty

Copy the folder
```
cp -r $HOME/dotfiles/kitty $HOME/.config/
```
And now restart kitty and you'll see changes.

<a name="neovim"></a>
## Neovim

This is more complex to do, so you will need:
1. Install neovim (version >= 6.0.0)
2. Create nvim directory inside $HOME/.config
```
mkdir -p $HOME/.config/nvim
```
3. Install a plugin manager (vim-plug, pathogen, packer.nvim etc). In this dotfile, I use paq-nvim, so acess the [Paq-nvim](https://github.com/savq/paq-nvim) and follow the instructions.
4. Now, copy the neovim config to nvim directory:
```
cp -r $HOME/dotfiles/init.lua $HOME/.config/nvim/
```
5. Enter neovim by typing nvim on terminal
```
nvim
```
6. Now install all the plugins:
```
:PaqInstall
```
7. Source the init.lua:
```
:luafile %
or
:source %
```
If you don't see any changes, exit neovim and open again. With this, you'll see neovim working right.

<a name="list-of-plugins"></a>
#### List of plugins

Terminal:

* FTerm.nvim (optional)

Autocomplete:

* LuaSnip
* cmp-buffer
* cmp-cmdline
* cmp-nvim-lsp
* cmp-path
* cmp_luasnip
* nvim-cmp
* lspkind-nvim (icons to completion)

Status bar (alternative to airline):

* lualine.nvim

Commenter:

* nvim-comment

Installer of LSP for nvim (more practical)

* nvim-lsp-installer

To configure LSP (you won't do anything with this, just install. All configurations are made with nvim-lsp-installer)

* nvim-lspconfig

File explorer (alternative to NERDTree):

* nvim-tree.lua

Treesitter to make highlights (this plugin can do much more, so check their wiki)

* nvim-treesitter

Icons for luatree and lualine

* nvim-web-devicons

<a name="sway"></a>
## Sway + Waybar

Copy the config file of sway
```
cp -r $HOME/dotfiles/sway $HOME/.config/
```
Now copy the config directory of waybar
```
cp -r $HOME/dotfiles/waybar $HOME/.config/
```
With this, just press Super + Shift + C and you'll see changes.

<a name="arch-users"></a>
## For Arch users (BTW I use arch :rofl:)

I don't recommend my config without see the [wiki](https://wiki.archlinux.org/), but if you already know what [pacman.conf](https://wiki.archlinux.org/title/pacman) and [makepkg.conf](https://wiki.archlinux.org/title/makepkg) do, so just copy config file:

WARNING: I use doas to use use root privileges, so just change to command root you installed
Firstly the pacman:
```
doas cp -r $HOME/dotfiles/pacman.conf /etc/pacman.conf
```
Makepkg:
```
doas cp -r $HOME/dotfiles/makepkg.conf /etc/makepkg.conf
```
<a name="license"></a>
# License

This project is under the MIT license. See the LICENSE for details.

[LICENSE](LICENSE)

Made with ♥ by [Victor Pinheiro](https://www.linkedin.com/in/victor-4-pinheiro/)
