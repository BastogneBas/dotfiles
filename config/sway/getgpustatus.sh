#!/bin/bash
set -e
gpuinput=/proc/acpi/bbswitch
if [ $? -eq 1 ]
then
	echo "{\"text\":\"bbswitch not loaded\", \"class\": \"nobbswitch\"}"
elif grep "0000:01:00.0 OFF" $gpuinput > /dev/null
then
	echo "{\"text\":\"\", \"class\":\"gpuoff\"}"
elif grep "0000:01:00.0 ON" $gpuinput > /dev/null
then
	echo "{\"text\":\"GPU\", \"class\":\"gpuon\"}"
else
	echo "{\"text\":\"GPU not found\", \"class\":\"nogpu\"}"
fi
