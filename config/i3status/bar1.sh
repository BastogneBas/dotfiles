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

gpuline()
{
	gpuinput=/proc/acpi/bbswitch
	if [ $? -eq 1 ]
	then
		echo "{\"full_text\":\"bbswitch not loaded\", \"color\":\"#ff0000\"},"
	elif grep "0000:01:00.0 OFF" $gpuinput > /dev/null
	then
		echo "{\"full_text\":\"\", \"color\":\"#ffffff\"},"
	elif grep "0000:01:00.0 ON" $gpuinput > /dev/null
	then
		echo "{\"full_text\":\"GPU\", \"color\":\"#ffff00\"},"
	else
		echo "{\"full_text\":\"GPU not found\", \"color\":\"#ff0000\"},"
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
		fan1line
		fan2line
		echo "{\"min_width\":75,\"full_text\":\" \"},"
		echo "${line:2:-1}," || exit 1
		echo "{\"min_width\":75,\"full_text\":\" \"},"
		echo "{\"full_text\":\"C0: $(~/.config/sway/getclockspeedinghz.sh 0)GHz\"},"
		echo "{\"full_text\":\"C1: $(~/.config/sway/getclockspeedinghz.sh 1)GHz\"},"
		echo "{\"full_text\":\"C2: $(~/.config/sway/getclockspeedinghz.sh 2)GHz\"},"
		echo "{\"full_text\":\"C3: $(~/.config/sway/getclockspeedinghz.sh 3)GHz\"},"
		gpuline
		echo "{\"full_text\":\"\"}"
#		echo "{\"full_text\":\"C4: $(~/.config/sway/getclockspeedinghz.sh 4)GHz\"},"
#		echo "{\"full_text\":\"C5: $(~/.config/sway/getclockspeedinghz.sh 5)GHz\"},"
#		echo "{\"full_text\":\"C6: $(~/.config/sway/getclockspeedinghz.sh 6)GHz\"},"
#		echo "{\"full_text\":\"C7: $(~/.config/sway/getclockspeedinghz.sh 7)GHz\"}"
		echo "]"
	done
}
i3status -c /home/bas/.config/sway/i3statusconfig1 | a
