#!/bin/bash

fan1line()
{
	faninput=$(cat /sys/devices/virtual/hwmon/*/fan1_input)
	if [ $faninput -gt 4000 ]
	then
		echo "{\"full_text\":\"SYSFAN: ${faninput}RPM\", \"color\":\"#ff0000\"},"
	else
		echo "{\"full_text\":\"SYSFAN: ${faninput}RPM\", \"color\":\"#00ff00\"},"
	fi
}

fan2line()
{
	faninput=$(cat /sys/devices/virtual/hwmon/*/fan2_input)
	if [ $faninput -gt 4000 ]
	then
		echo "{\"full_text\":\"GPUFAN: ${faninput}RPM\", \"color\":\"#ff0000\"},"
	else
		echo "{\"full_text\":\"GPUFAN: ${faninput}RPM\", \"color\":\"#00ff00\"},"
	fi
}

a()
{
	read line; echo $line
	read line; echo $line
	read line; echo $line
	while :
	do
		read line
		#echo $line || exit 1
		echo ",["
		echo "{\"full_text\":\"$(~/.config/sway/spotify.sh)\"},"
		echo "{\"name\":\"tztime\",\"instance\":\"home\",\"markup\":\"none\",\"full_text\":\"Cluj-Napoca: $(LC_TIME="eo.utf8" TZ='Europe/Bucharest' date +"%H:%M:%S %Z")\", \"color\":\"#8f8f8f\",\"timezone\":\"Europe/Bucharest\"},"
		echo "{\"name\":\"tztime\",\"instance\":\"unixtime\",\"markup\":\"none\",\"full_text\":\"$(date +%s)\"},"
		echo "{\"name\":\"tztime\",\"instance\":\"local\",\"markup\":\"none\",\"full_text\":\"$(LC_TIME="eo.utf8" date +"%A %d %B %Y %H:%M:%S %Z")\",\"min_width\":300},"
		echo "{\"full_text\":\"BL: $(xbacklight -ctrl intel_backlight -get)%\"},"
		echo "${line:2:-1}," || exit 1
		echo "{\"full_text\":\"$(~/.config/sway/checkBat.sh)\", \"color\":\"#ff0000\"}"
		echo "]"
	done
}
i3status -c /home/bas/.config/sway/i3statusconfig0 | a
