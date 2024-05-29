#!/bin/sh

if [ "$1" == "2" ] ; then
  # Dos monitores.
  # ACER
  # xrandr --output eDP --mode 1440x900 --pos 80x900 --rotate normal --output HDMI-A-0 --primary --mode 1600x900 --pos 0x0 --rotate normal --output DisplayPort-0 --off --output DisplayPort-1 --off --output DisplayPort-2 --off --output DisplayPort-3 --off --output DisplayPort-4 --off --output DisplayPort-5 --off
  # Philips
  xrandr --output eDP --mode 1680x1050 --pos 120x1080 --rotate normal --output HDMI-A-0 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DisplayPort-0 --off --output DisplayPort-1 --off --output DisplayPort-2 --off --output DisplayPort-3 --off --output DisplayPort-4 --off --output DisplayPort-5 --off


else
  # Un monitor.
  # xrandr --output eDP --mode 1680x1050
  xrandr --output eDP --mode 1440x900 --pos 80x900 --rotate normal
fi

