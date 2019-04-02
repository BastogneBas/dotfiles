#!/bin/bash
spd=$(cat /sys/devices/system/cpu/cpufreq/policy$1/scaling_cur_freq)
awk "BEGIN { printf(\"%01.2f\", $spd/1000000) }"
