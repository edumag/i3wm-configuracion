#!/bin/bash

## En caso de que la catga de la batería baje del numero establecido enviamos una notificación.

BATERIA_BAJA=12
POWER_SUPPLY_STATUS=$(cat /sys/class/power_supply/BAT0/uevent | grep 'POWER_SUPPLY_STATUS' | cut -d= -f2)

while [ 1 -le 1 ] ; do

  ESTADO=$(cat /sys/class/power_supply/BAT0/uevent | grep 'POWER_SUPPLY_CAPACITY=' | cut -d= -f2)

  # echo "Estado de la carga de la batería: ${ESTADO}%, $POWER_SUPPLY_STATUS"

  if [ $ESTADO -lt $BATERIA_BAJA ] && [ "$POWER_SUPPLY_STATUS" == "Discharging" ] ; then

    notify-send "Carga de bateria baja ${ESTADO}%"

  fi
  
  sleep 1m

done


