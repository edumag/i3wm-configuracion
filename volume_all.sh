#!/bin/bash

sinks=`pactl list sinks |& grep -E "Sink #" | cut -f2 -d#`

if [ -z $sinks ] ; then
    sinks=`pactl list sinks |& grep -E "Destino #" | cut -f2 -d#`
fi

# echo "Sink: $sinks"

for s in $sinks ; do
    if [ "$1" == "-" ] ; then
        pactl set-sink-volume $s -5%
    else
        pactl set-sink-volume $s +5%
    fi
done
