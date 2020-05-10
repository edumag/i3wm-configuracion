#!/bin/bash
egrep -rh '^Exec' ~/.config/autostart | while read -r line ; do 
   cmd=`echo $line | cut -d= -f2-`
   # echo $cmd
   eval "$cmd" >/dev/null &
done

if [ -d ~/.config/autostart-scripts ] ; then
    cd ~/.config/autostart-scripts
    for c in "*" ; do
        $c
    done
    cd -
fi
