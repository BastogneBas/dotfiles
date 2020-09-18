#!/bin/bash
cp ~/.profile profile
cp ~/.vimrc vimrc
cp ~/.xinitrc xinitrc
cp ~/.Waylandresources Waylandresources
cp ~/.Xresources Xresources
cp ~/.zshrc zshrc

cp /usr/src/linux/.config ./linuxconfig

sudo mount --bind ~/.vim vim
sudo mount --bind ~/.xkb xkb

sudo mount --bind ~/Backgrounds Backgrounds

sudo mount --bind ~/.config/fontconfig config/fontconfig
sudo mount --bind ~/.config/gtk-2.0 config/gtk-2.0
sudo mount --bind ~/.config/gtk-3.0 config/gtk-3.0
sudo mount --bind ~/.config/gtk-4.0 config/gtk-4.0
sudo mount --bind ~/.config/i3 config/i3
sudo mount --bind ~/.config/i3status config/i3status
sudo mount --bind ~/.config/mpd config/mpd
sudo mount --bind ~/.config/mpDris2 config/mpDris2
sudo mount --bind ~/.config/neofetch config/neofetch
sudo mount --bind ~/.config/nitrogen config/nitrogen
sudo mount --bind ~/.config/polybar config/polybar
sudo mount --bind ~/.config/qutebrowser config/qutebrowser
sudo mount --bind ~/.config/rofi config/rofi
sudo mount --bind ~/.config/sway config/sway
sudo mount --bind ~/.config/swaylock config/swaylock
sudo mount --bind ~/.config/termite config/termite
sudo mount --bind ~/.config/waybar config/waybar
sudo mount --bind ~/.config/X11 config/X11

sudo mount --bind /etc/X11/ etc/X11
