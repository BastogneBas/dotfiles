#!/bin/bash
set -e
fan=0
if [ $1 == 1 ]
then
	fan=SYSFAN
elif [ $1 == 2 ]
then
	fan=GPUFAN
else
	echo "{\"text\":\"No fan selected\"}"
	exit 1
fi
while true
do
	faninput=$(cat /sys/devices/virtual/hwmon/*/fan$1_input)
	fanpct=$(awk "BEGIN { printf(\"%2.0f\", ($faninput/5400)*100)}")
	if [ $faninput -gt 4000 ]
	then
		class=high
#		echo "{\"text\":\"$fan: ${faninput}RPM\", \"class\":\"high\", \"percentage\": \"$fanpct\"},"
	elif [ $faninput -lt 3000 ]
	then
		class=low
#		echo "{\"text\":\"$fan: ${faninput}RPM\", \"class\":\"low\"},"
	else
		class=medium
#		echo "{\"text\":\"$fan: ${faninput}RPM\", \"class\":\"medium\"},"
	fi
	echo "{\"text\":\"$fan: ${faninput}RPM\", \"class\":\"$class\", \"percentage\": $fanpct},"
	/usr/bin/sleep 0.25s
done
