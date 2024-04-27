#!/bin/bash

directory=~/.config/i3/custom_scripts/

selected=$(ls $directory | rofi -dmenu -p "Run: ")
/bin/bash $directory/$selected


