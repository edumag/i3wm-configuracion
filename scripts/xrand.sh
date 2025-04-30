#!/bin/bash

if [ $1 = "2" ] ; then
  echo "Dos monitores."
  # xrandr --output eDP --primary --mode 1440x900 --pos 1920x180 --rotate normal \
  #     --output HDMI-A-0 --mode 1920x1080 --pos 0x0 --rotate normal
  # Monitor pequeño menos resolución.
  xrandr --output eDP --primary --mode 1280x800 --pos 1920x373 --rotate normal \
      --output HDMI-A-0 --mode 1920x1080 --pos 0x0 --rotate normal

elif [ $1 = "3" ] ; then
  echo "Apagamos pantalla portatil."

  xrandr --output eDP --off

elif [ $1 = "4" ] ; then
  echo "Monitor externo en hub."
  xrandr \
      --output eDP --primary --mode 1280x800 --pos 1920x206 --rotate normal \
      --output HDMI-A-0 --off \
      --output DisplayPort-0 --off \
      --output DisplayPort-1 --mode 1920x1080 --pos 0x0 --rotate normal \
      --output DisplayPort-2 --off \
      --output DisplayPort-3 --off \
      --output DisplayPort-4 --off \
      --output DisplayPort-5 --off

else
  echo "Un monitor."
  # xrandr --output eDP --mode 1680x1050
  xrandr --output eDP --mode 1440x900 --pos 80x900 --rotate normal
fi

