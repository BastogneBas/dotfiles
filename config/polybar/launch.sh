#!/usr/bin/env bash

killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar bar1 &
polybar bar2 &
polybar bar3 &
polybar bar4 &
polybar bar5 &
polybar bar6 &
polybar bar7 &
polybar bar8 &

#polybar wbar1 &
#polybar wbar8 &

echo bars launched...
