#!/bin/sh

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

REPO_URL_NVIM="https://github.com/ahmad9059/nvim"

# Pacman
PACMAN_PACKAGES=(
  eza sway bemenu-wayland telegram-desktop 
  firefox qbittorrent udiskie protonmail-bridge proton-vpn-gtk-app 
  noto-fonts-emoji noto-fonts noto-fonts-cjk noto-fonts-extra ttf-noto-font-nerd ttf-jetbrains-mono
  steam wl-clip-persist imagemagick resvg poppler ffmpeg bitwarden lazygit apparmor
  thunderbird mise starship gnupg git bottom pavucontrol gamemode gamescope 7zip waybar
  gnome-keyring seahorse gdu ntfs-3g efibootmgr os-prober mtools openssh ly calibre elisa
  qt5-wayland qt6-wayland realtime reflector rustup mold
)

# Mandatory packages
REQUIRED_PACKAGES=(
    foot tmux toml-bombadil neovim yazi darkman
    linux-zen linux-zen-headers ripgrep curl wget
    linux-firmware fzf jq zoxide fd wl-clipboard grim
    slurp network-manager-applet networkmanager wf-recorder mako dkms
    base-devel grub fish
)

YAY_PACKAGES=(
  vesktop proton-ge-custom-bin ntsync wl-gammarelay-rs
  ntsync-dkms ntsync-header brave-bin ripdrag-git 
  xdg-desktop-portal-termfilechooser-hunkyburrito-git selectdefaultapplication-fork-git apparmor.d-git
  stremio suwayomi-server-preview-bin heroic-games-launcher-bin 
)

# Installation
#

# Enable connetion to Internet
sudo systemctl enable --now systemd-networkd.service

#Required Packages
echo -e "${GREEN}📥 Installing required packages...${NC}"
sudo pacman -Sy --noconfirm --needed "${REQUIRED_PACKAGES[@]}"

# Ask to install pacman packages
echo -e "\n${YELLOW}📦 Do you want to install the following pacman packages?${NC}"
echo "${PACMAN_PACKAGES[@]}"
read -rp "Type 'yes/no' to continue: " ans1
if [[ "$ans1" == "yes" ]]; then
  sudo pacman -Sy --needed "${PACMAN_PACKAGES[@]}"
fi

# Install yay

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# Ask to install yay packages
echo -e "\n${YELLOW}📦 Do you want to install the following AUR (yay) packages?${NC}"
echo "${YAY_PACKAGES[@]}"
read -rp "Type 'yes/no' to continue: " ans2
if [[ "$ans2" == "yes" ]]; then
    yay -Syu --needed "${YAY_PACKAGES[@]}"
fi

# Copying files to their location
bombadil link
sudo cp -rf reflector.conf /etc/xdg/reflector/reflector.conf
sudo cp -rf makepkg.conf makepkg.conf.d environment gamemode.ini /etc/
sudo cp -rf ./darkman/* /usr/local/share/

# Enable services

systemctl --user restart xdg-desktop-portal.service
sudo systemctl enable --now NetworkManager.service
sudo systemctl enable --now reflector.service

# Add user to groups
sudo usermod -aG gamemode,realtime,audio,video,wheel,suwayomi-server $USER
