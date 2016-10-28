#!/bin/sh

# Various drivers/utils
sudo pacman -S grub
sudo pacman -S xf86-input-synaptics
sudo pacman -S xf86-video-intel
sudo pacman -S iw
sudo pacman -S wpa_supplicant dialog
sudo pacman -S alsa-utils
sudo pacman -S mlocate

# === Core display stuff ===

# X window system
sudo pacman -S xorg-xrandr
sudo pacman -S xorg-xrdb
sudo pacman -S xorg-server
sudo pacman -S xorg-xinit

# Display manager
sudo pacman -S lightdm
sudo pacman -S lightdm-gtk-greeter
sudo pacman -S lightdm-gtk-greeter-settings
sudo systemctl enable lightdm.service

# Window manager
sudo pacman -S i3-wm i3status i3lock dmenu
# xinitrc + i3 config files

# Fonts
sudo pacman -S ttf-dejavu

# === Various software ===

# Network manager
sudo pacman -S networkmanager network-manager-applet
sudo systemctl enable NetworkManager.service

# Browser
sudo pacman -S chromium

# Terminal emulator
sudo pacman -S rxvt-unicode
# .Xresources

# Image viewer + screenshots
sudo pacman -S feh scrot

# Notification daemon
sudo pacman -S notify-osd

# Sound + multimedia
sudo pacman -S alsa-utils
sudo pacman -S pulseaudio pulseaudio-alsa volumeicon
sudo pacman -S vlc
