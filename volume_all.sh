#!/bin/bash

sinks=`pactl list sinks |& grep -E "Sink #" | cut -f2 -d#`

for s in $sinks ; do
    if [ "$1" == "-" ] ; then
        pactl set-sink-volume $s -5%
    else
        pactl set-sink-volume $s +5%
    fi
done
