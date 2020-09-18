#setxkbmap us dvorak-intl
xset +fp /home/bas/.fonts
xset fp rehash

echo "Hallo" >> ~/Downloads/echo


#xrandr --output eDP1 --auto --dpi 196
xrandr --output eDP1 --auto --output DP1 --auto --right-of eDP1 --primary
xrandr --output eDP1 --auto --output DP2 --auto --right-of eDP1 --primary --output HDMI1 --auto --right-of DP2
xrandr --output eDP-1 --auto --output DP-2 --auto --right-of eDP-1 --primary --output HDMI-1 --auto --right-of DP-2
xrandr --output eDP-1-1 --auto --output DP-1-2 --auto --right-of eDP-1-1 --primary --output HDMI-1-1 --auto --right-of DP-1-2
xrandr --output eDP-2-1 --auto --output DP-2 --auto --right-of eDP-2-1 --primary
xrandr --output HDMI-1-1 --auto --right-of eDP-1-1

xrandr --output DVI-D-0 --auto --right-of VGA-0 --primary --output VGA-0 --auto
xrandr --output DVI-D-0 --auto --right-of DP-0 --output DP-0 --auto --primary >> ~/Downloads/xrandr

xrdb -merge ~/.Xresources

dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

#xcompmgr -c &
#compton -c &
exec dbus-launch --autolaunch=$(cat /var/lib/dbus/machine-id) i3 -V >> ~/Downloads/i3logfile
#exec xterm
