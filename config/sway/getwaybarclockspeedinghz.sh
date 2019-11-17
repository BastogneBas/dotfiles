#!/bin/bash
set -e
while true
do
	spd=$(cat /sys/devices/system/cpu/cpufreq/policy$1/scaling_cur_freq)
	output=$(awk "BEGIN { printf(\"%01.2f\", $spd/1000000) }")
	if (( $(echo "$output > 2.8" | bc -l) ))
	then
		class=high
	else
		class=low
	fi
	percentage=$(awk "BEGIN { printf(\"%2.0f\", ($output/3.8)*100) }")
	echo "{\"text\":\"$output\", \"class\":\"$class\", \"percentage\":$percentage},"
	/usr/bin/sleep 0.25s
done
