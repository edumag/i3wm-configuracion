#!/bin/bash

# ACTUAL=`xrandr --current --verbose | grep Brightness | cut -d' ' -f2`
ACTUAL=`sudo cat /sys/class/backlight/intel_backlight/brightness`

if [ -z $1 ] ; then
    echo
    echo "uso: `basename $0` [+|-]"
    exit
fi

if [ "$1" == "+" ] ; then
    NUEVO=`echo $ACTUAL + 10 | bc`
else
    NUEVO=`echo $ACTUAL - 10 | bc`
fi

#xrandr --output LVDS-1 --brightness $NUEVO
echo $NUEVO | sudo tee /sys/class/backlight/intel_backlight/brightness


if [ $? == 0 ] ; then
    killall dunst
    notify-send  "Brightness: $NUEVO" 
    exit
fi

exit 1



