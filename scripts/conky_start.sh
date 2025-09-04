#!/bin/bash

MONITORS=$(xrandr --listmonitors | grep ": +" | wc -l)

killall conky
sleep 1

echo "MONITORS: $MONITORS"

if [ $MONITORS -eq 1 ]; then
    conky -c /home/edumag/.config/i3/conky/conky_time.conf
    exit 0
else
    conky -c /home/edumag/.config/i3/conky/conky_time.conf &
    conky -c /home/edumag/.config/i3/conky/conky_time2.conf &
    exit 0
fi

