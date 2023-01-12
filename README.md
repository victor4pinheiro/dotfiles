# Dotfiles
[![GitHub license](https://img.shields.io/github/license/victor4pinheiro/dotfiles?style=for-the-badge)](https://github.com/victor4pinheiro/dotfiles/blob/main/LICENSE)
[![Linkedin: victor4pinheiro](https://img.shields.io/badge/-victor4pinheiro-blue?style=for-the-badge&logo=Linkedin&logoColor=white&link=https://www.linkedin.com/in/victor-4-pinheiro)](https://www.linkedin.com/in/victor-4-pinheiro)

Welcome to my dotfiles repo. Below you'll find  a list of my dotfiles, including neovim, sway and waybar.

If you're new to sway and Wayland, you need to install alternatives for your programs to be compatible with Wayland, see this [guide](https://github.com/swaywm/sway/wiki/i3-Migration-Guide#common-x11-apps-used-on-i3-with-wayland-alternatives)

# Changelog

* v0.1.0:
    * Using dmenu and Xwayland;
* v0.2.0:
    * Using wofi and removed xwayland;
* v0.3.0:
    * For neovim, change to packer.nvim to manage plugins and separating each section in their each file (shortcuts, plugins and config);
    * Not using kitty anymore. Currently using foot;
    * Some icons on waybar changed: Using font-awesome icons.
* v0.4.0:
    * Testing [helix](https://helix-editor.com/);
    * Remove wallpaper (too much heavy);
    * Change waybar to swaybar (waybar too slow on boot)
    * Change wofi to bemenu-wayland
* Current version:
    * Using VSCode as default
    * Set wallpaper to my monitors again, because there is no sense to not use in dual monitors (it consumes little ram compared to waybar)
    * Update sway to make it more "organized"
    * Using waybar because I like the feature of increasing or lower the volume level

# Summary
- [Dotfiles](#dotfiles)
- [Changelog](#changelog)
- [Summary](#summary)
- [:bulb: Getting Start](#bulb-getting-start)
  - [Prerequisites](#prerequisites)
    - [Fonts](#fonts)
    - [UI Components](#ui-components)
    - [Programs](#programs)
    - [Terminal](#terminal)
- [Screenshots](#screenshots)
- [How to use](#how-to-use)
  - [Foot (Foo terminal)](#foot-foo-terminal)
  - [Waybar](#waybar)
  - [Sway](#sway)
  - [For Arch users (BTW I use arch :rofl:)](#for-arch-users-btw-i-use-arch-rofl)
  - [Environment Varibles](#environment-varibles)
  - [MPV](#mpv)
- [Issues](#issues)
- [License](#license)

<a name="start"></a>
# :bulb: Getting Start

<a name="prerequisites"></a>
## Prerequisites

<a name="fonts"></a>
### Fonts

* [JetBrains Mono NerdFonts](https://www.nerdfonts.com/)
* [Other Nerd Fonts](https://github.com/ryanoasis/nerd-fonts) (optional)
* [Roboto](https://fonts.google.com/specimen/Roboto)
* [Awesome terminal fonts](https://github.com/gabrielelana/awesome-terminal-fonts)

<a name="ui"></a>
### UI Components

* Window manager: [SwayWM](https://swaywm.org/)
* Status bar: [Waybar](https://github.com/Alexays/Waybar)
* Application launcher: [bemenu](https://github.com/Cloudef/bemenu)

<a name="programs"></a>
### Programs

* Protocol: [Wayland](https://wayland.freedesktop.org/) for Sway (Pure wayland, not Xwayland)
* Version manager: [Git](https://git-scm.com/)
* Terminal: [Foot](https://codeberg.org/dnkl/foot)
* Editor: [VSCode](https://code.visualstudio.com/)
* Audio: [Pipewire](https://pipewire.org/) with pipewire-pulse

<a name="terminal"></a>
### Terminal

* Prompt (including theme): [Starship](https://starship.rs/)
* Shell: [Fish shell](https://fishshell.com/)
* Manage multiple runtime versions: [asdf-vm](https://asdf-vm.com/)
* GNUPG to sign keys

<a name="screenshot"></a>
# Screenshots

<h3>Background</h3>

![Screenshot fot system](./images/clear.png)

<h3>System with wofi</h3>

![Screenshot of system with bemenu, terminal and vscode](./images/terminal_menu.png)

<a name="how-to-use"></a>
# How to use

Firstly, clone the files in your home directory:
```
git clone https://github.com/victor4pinheiro/dotfiles $HOME/
```

<a name="foot"></a>
## Foot (Foo terminal)

Copy the folder
```
cp -r $HOME/dotfiles/foot $HOME/.config/
```
In previous version, I used to kitty as my default terminal, but I searched for a lightweight alternative and so I found foot.

I think it is more lightweight, easy to customize and totally made for Wayland.

<a name="waybar"></a>
## Waybar

Copy the config file of waybar
```
cp -r $HOME/dotfiles/waybar $HOME/.config/
```

<a name="sway"></a>
## Sway

Copy the config file of sway
```
cp -r $HOME/dotfiles/sway $HOME/.config/
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
<a name="Environment Path"></a>
## Environment Varibles

Using Wayland, sometimes I need to force apps to use Wayland or to set hardware acceleration to some apps.
Remember, I don't have any responsability. It's up to you all problems that can happs.
```
doas cp -r $HOME/dotfiles/environment /etc/environment
```

<a name="MPV"></a>
## MPV
MPV is a lightweight videoplayer and I set to use VA-API acceleration.
```
cp -r $HOME/dotfiles/mpv $HOME/.config/ 
```

<a name="issues"></a>
# Issues

Feel free to file a new issue with a respective title and description.

<a name="license"></a>
# License

This project is under the MIT license. See the LICENSE for details.

[LICENSE](LICENSE)

Made with :heart: by [Victor Pinheiro](https://www.linkedin.com/in/victor-4-pinheiro/)
