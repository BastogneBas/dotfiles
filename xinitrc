#setxkbmap us dvorak-intl
xset +fp /home/bas/.fonts
xset fp rehash



#xrandr --output eDP1 --auto --dpi 196
xrandr --output eDP1 --auto --output DP1 --auto --right-of eDP1 --primary
xrandr --output eDP1 --auto --output DP2 --auto --right-of eDP1 --primary --output HDMI1 --auto --right-of DP2
xrandr --output eDP-1 --auto --output DP-2 --auto --right-of eDP-1 --primary --output HDMI-1 --auto --right-of DP-2
xrandr --output eDP-1-1 --auto --output DP-1-2 --auto --right-of eDP-1-1 --primary --output HDMI-1-1 --auto --right-of DP-1-2

xrdb -merge ~/.Xresources

dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

#xcompmgr -c &
#compton -c &
exec i3 -V -d all >> ~/Downloads/i3logfile
#exec xterm
