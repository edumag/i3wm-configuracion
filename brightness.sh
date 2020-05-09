#!/bin/bash

ACTUAL=`xrandr --current --verbose | grep Brightness | cut -d' ' -f2`

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

xrandr --output LVDS-1 --brightness $NUEVO

if [ $? == 0 ] ; then
    echo "Brightness: $NUEVO" 
    exit
fi

exit 1



