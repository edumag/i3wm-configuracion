#!/bin/bash

# SECOND_MONITOR="HDMI-A-0"
SECOND_MONITOR="DisplayPort-1"

OPTION=${1:-"0"}

if [ "$OPTION" = "2" ] ; then
  echo "Dos monitores."
  xrandr \
      --output $SECOND_MONITOR --mode 1920x1080 --pos 0x0 --rotate normal \
      --output eDP --primary --mode 1280x800 --pos 1920x373 --rotate normal

elif [ "$OPTION" = "3" ] ; then
  echo "Apagamos pantalla portátil."

  xrandr --output eDP --off
  xrandr \
      --output $SECOND_MONITOR --primary --mode 1920x1080 --pos 0x0 --rotate normal

elif [ "$OPTION" = "4" ] ; then
  echo "Monitor externo en hub."
  xrandr \
      --output eDP --primary --mode 1280x800 --pos 1920x206 --rotate normal \
      --output DisplayPort-1 --mode 1920x1080 --pos 0x0 --rotate normal

else
  echo "Un monitor."
  # xrandr --output eDP --mode 1680x1050
  xrandr \
      --output eDP --primary --mode 1440x900 --pos 80x900 --rotate normal \
      --output $SECOND_MONITOR --off
fi

