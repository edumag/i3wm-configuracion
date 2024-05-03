#!/bin/sh

if [ "$1" == "2" ] ; then
  # Dos monitores.
  # xrandr --output eDP --mode 1680x1050 --pos 0x900 --rotate normal --output HDMI-A-0 --primary --mode 1600x900 --pos 0x0 --rotate normal --output DisplayPort-0 --off --output DisplayPort-1 --off --output DisplayPort-2 --off --output DisplayPort-3 --off --output DisplayPort-4 --off --output DisplayPort-5 --off
  # xrandr --output eDP --primary --mode 1680x1050  --pos 249x1350 --rotate normal --output HDMI-A-0 --mode 1600x900 --pos 0x0 --scale 1.5x1.5
  xrandr --output eDP --mode 1440x900 --pos 80x900 --rotate normal --output HDMI-A-0 --primary --mode 1600x900 --pos 0x0 --rotate normal --output DisplayPort-0 --off --output DisplayPort-1 --off --output DisplayPort-2 --off --output DisplayPort-3 --off --output DisplayPort-4 --off --output DisplayPort-5 --off

else
  # Un monitor.
  # xrandr --output eDP --mode 1680x1050
  xrandr --output eDP --mode 1440x900 --pos 80x900 --rotate normal
fi

