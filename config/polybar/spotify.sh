#!/bin/bash

if [ "$(playerctl status 2> /dev/null)" == "Playing" -o "$(playerctl status 2> /dev/null)" == "Paused" ]; then
	ARTIST=$(playerctl metadata xesam:artist)
	TITLE=$(playerctl metadata xesam:title)
	echo "$ARTIST - $TITLE"
#elif playerctl status 2> /dev/null | grep -q 'Paused'; then
#	ARTIST=$(playerctl metadata xesam:artist)
else
	echo ""
fi
