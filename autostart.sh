#!/bin/bash
egrep -rh '^Exec' $HOME/.config/autostart | while read -r line ; do
   cmd=`echo $line | cut -d= -f2-`
   # echo $cmd
   eval "$cmd" & # >/dev/null &
done

if [ -d $HOME/.config/i3/autostart ] ; then
    cd $HOME/.config/i3/autostart
    for launch in * ; do
      # echo "$launch"
      ./$launch &
    done
    cd -
fi

