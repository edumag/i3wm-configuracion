#!/bin/bash

# Monitor
monitores=`xrandr --listmonitors | cut -d ' ' -f6 `

# ACTUAL=`xrandr --current --verbose | grep Brightness | cut -d' ' -f2`
# ACTUAL=`sudo cat /sys/class/backlight/intel_backlight/brightness`
ACTUAL=`xrandr --current --verbose | grep Brightness | head -n 1 | cut -d' ' -f2`

monitores=`xrandr --listmonitors | cut -d ' ' -f6 `
if [ -z $1 ] ; then
    echo
    echo "uso: `basename $0` [+|-]"
    exit
fi

if [ "$1" == "+" ] ; then
    NUEVO=`echo $ACTUAL + 0.1 | bc`
else
    NUEVO=`echo $ACTUAL - 0.1 | bc`
fi

echo "Nuevo: $NUEVO"
# exit

for m in $monitores ; do
  xrandr --output $m --brightness $NUEVO
done
# echo $NUEVO | sudo tee /sys/class/backlight/intel_backlight/brightness

echo "Brightness: $NUEVO"

if [ $? == 0 ] ; then
    # killall dunst
    notify-send  "Brightness: $NUEVO"
    exit
fi

exit 1



