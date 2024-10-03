#!/bin/bash

if [[ "$1" -gt "2" ]] ; then
  echo "Dos monitores."
  # ACER
  # xrandr --output eDP --mode 1440x900 --pos 80x900 --rotate normal --output HDMI-A-0 --primary --mode 1600x900 --pos 0x0 --rotate normal --output DisplayPort-0 --off --output DisplayPort-1 --off --output DisplayPort-2 --off --output DisplayPort-3 --off --output DisplayPort-4 --off --output DisplayPort-5 --off
  # Philips
  # xrandr \
  #     --output HDMI-A-0 --mode 1920x1080 --pos 0x0 --rotate normal \
  #     --output eDP --primary --mode 1440x900 --pos 1920x334 --rotate normal
  # xrandr --output eDP --primary --mode 1440x900 --pos 1920x180 --rotate normal \
  #     --output HDMI-A-0 --mode 1920x1080 --pos 0x0 --rotate normal \
  #     --output DisplayPort-0 --off --output DisplayPort-1 --off \
  #     --output DisplayPort-2 --off --output DisplayPort-3 --off \
  #     --output DisplayPort-4 --off --output DisplayPort-5 --off
  xrandr --output eDP --primary --mode 1440x900 --pos 1920x180 --rotate normal \
      --output HDMI-A-0 --mode 1920x1080 --pos 0x0 --rotate normal

elif [ "$1" -gt "3" ] ; then
  echo "Apagamos pantalla portatil."

  xrandr --output eDP --off \
      --output HDMI-A-0  --primary --mode 1920x1080 --pos 0x0 --rotate normal


else
  echo "Un monitor."
  # xrandr --output eDP --mode 1680x1050
  xrandr --output eDP --mode 1440x900 --pos 80x900 --rotate normal
fi

