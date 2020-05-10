#!/bin/bash
egrep -rh '^Exec' $HOME/.config/autostart | while read -r line ; do 
   cmd=`echo $line | cut -d= -f2-`
   # echo $cmd
   eval "$cmd" >/dev/null &
done

if [ -d $HOME/.config/autostart-scripts ] ; then
    cd $HOME/.config/autostart-scripts
    for c in "*" ; do
        $c
    done
    cd -
fi
