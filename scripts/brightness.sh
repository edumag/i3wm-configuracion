#!/bin/bash

# Monitor
monitores=`xrandr --listmonitors | cut -d ' ' -f6 `
monitor1=`echo $monitores | cut -d ' ' -f1 `
monitor2=`echo $monitores | cut -d ' ' -f2 `

# ACTUAL=`xrandr --current --verbose | grep Brightness | cut -d' ' -f2`
# ACTUAL=`sudo cat /sys/class/backlight/intel_backlight/brightness`
brillos=`xrandr --verbose | grep Brightness | cut -d':' -f2`
brillo2=`echo $brillos | cut -d' ' -f1`
brillo1=`echo $brillos | cut -d' ' -f2`

monitores=`xrandr --listmonitors | cut -d ' ' -f6 `
if [ -z $1 ] ; then
    echo
    echo "uso: `basename $0` [+|-]"
    echo
    echo "Especificar brillo en un monitor"
    echo "uso: `basename $0` [+|-] [1|2]"
    echo
    echo "monitores:"
    echo
    echo "Monitor1 $monitor1 $brillo1"
    echo "Monitor2 $monitor2 $brillo2"
    exit
fi

if [ "$1" == "+" ] ; then
    NUEVO=`echo $brillo1 + 0.1 | bc`
    NUEVO1=`echo $brillo1 + 0.1 | bc`
    NUEVO2=`echo $brillo2 + 0.1 | bc`
else
    NUEVO=`echo $brillo1 - 0.1 | bc`
    NUEVO1=`echo $brillo1 - 0.1 | bc`
    NUEVO2=`echo $brillo2 - 0.1 | bc`
fi

count=1
for m in $monitores ; do
  if [ "$2" == "1" ] && [ "$count" == "1" ] ; then
    xrandr --output $m --brightness $NUEVO1
    echo "xrandr --output $m --brightness $NUEVO1"
    break
  fi
  if [ "$2" == "2" ] && [ "$count" == "2" ] ; then
    xrandr --output $m --brightness $NUEVO2
    echo "xrandr --output $m --brightness $NUEVO2"
    break
  fi
  if [ "$2" == "" ] ; then
    xrandr --output $m --brightness $NUEVO
    echo "xrandr --output $m --brightness $NUEVO"
  fi
  let "count=count+1"
done
# echo $NUEVO | sudo tee /sys/class/backlight/intel_backlight/brightness

echo "Brightness: $NUEVO1 $NUEVO2"

if [ $? == 0 ] ; then
    # killall dunst
    notify-send  "Brightness: $NUEVO1 $NUEVO2"
    exit
fi

exit 1



