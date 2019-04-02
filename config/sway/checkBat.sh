#!/bin/bash
pct=$(($(cat /sys/class/power_supply/BAT0/capacity)))

DISMISS20=0
DISMISS10=0
if ! [ -a ~/.config/polybar/DISMISS20 ]; then DISMISS20=0
else DISMISS20=$(($(cat ~/.config/polybar/DISMISS20)))
fi
if ! [ -a ~/.config/polybar/DISMISS10 ]; then DISMISS10=0
else DISMISS10=$(($(cat ~/.config/polybar/DISMISS10)))
fi
#echo DISMISS10=$DISMISS10
#echo $pct
if [ $pct -lt 11 ]
then
	if [ $(cat /sys/class/power_supply/AC/online) -eq 0 ]
	then
		echo "BATTERY LOW!!!!"
		if [ $DISMISS10 -eq 0 ]; then
			zenity --error --no-wrap --text="Battery critically low!!!\nYour pc could turn off every moment."
			if [ $? -eq 0 ]
			then
				DISMISS10=1
			fi
		fi
	else
		DISMISS10=0
		echo
	fi
elif [ $pct -lt 21 ]
then
	if [ $(cat /sys/class/power_supply/AC/online) -eq 0 ]
	then
		echo "Watch out!"
		if [ $DISMISS20 -eq 0 ]; then
			zenity --warning --no-wrap --text="Battery low\!\!"
			if [ $? -eq 0 ]
			then
				DISMISS20=1
			fi
		fi
	else
		DISMISS20=0
		echo
	fi
else
	echo
fi

echo $DISMISS10 > ~/.config/polybar/DISMISS10
echo $DISMISS20 > ~/.config/polybar/DISMISS20
