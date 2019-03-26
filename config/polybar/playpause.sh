#!/bin/sh

if playerctl status 2> /dev/null | grep -q "Playing"; then
#icon-stop = 
	echo 
else
	echo 
fi
