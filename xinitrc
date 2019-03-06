#setxkbmap us dvorak-intl
xset +fp /home/bas/.fonts
xset fp rehash



#xrandr --output eDP1 --auto --dpi 196
xrandr --output eDP1 --auto --output DP1 --auto --right-of eDP1 --primary
xrandr --output eDP1 --auto --output DP2 --auto --right-of eDP1 --primary --output HDMI1 --auto --right-of DP2

xrdb -merge ~/.Xresources

dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

#xcompmgr -c &
#compton -c &
exec i3
