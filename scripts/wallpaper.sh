#!/bin/bash

erexit() {
    echo "$*"
    exit
}

[[ " $@ " =~ " force " ]] && rm /tmp/.bingwp.*

offset=0
# Generamos offset aleatorio si no nos llega.
[[ "$1" =~ [1-9][0-9]*$ ]] && offset=$1 || offset=${RANDOM:0:1}

echo "offset: $offset"

market=${LANG:-en-US}
market=${market%.*}
market=${market/_/-}
url="https://www.bing.com/HPImageArchive.aspx?idx=${offset}&n=1&mkt=${market}"
echo "url: $url"
read data < <(curl -s "https://www.bing.com/HPImageArchive.aspx?idx=${offset}&n=1&mkt=${market}")

# extract image url
image=${data#*\<url\>}
image=${image%\</url\>*}
# smaller versions
# 1920x1080, 1366x768, 1280x768, 1280x720, 1024x768, 800x600, 640x480

# do we need to update?
read md5 dash < <(md5sum <<< "$image")

set_wallpaper() {
    feh --bg-fill "/tmp/.bingwp.$md5"
    if type notify-send > /dev/null 2>&1; then
        info=${data#*\<copyright\>}
        info=${info%\</copyright\>*}
        notify-send -u low -t 8000 "New Bing Wallpaper" "$info"
    fi
}

if [ -e "/tmp/.bingwp.$md5" ]; then
    [[ " $@ " =~ "update" ]] && set_wallpaper
    exit
fi

# clean-up
rm /tmp/.bingwp.*

# get & set wallpaper
curl -s "https://www.bing.com/$image" > /tmp/.bingwp.$md5
[ -e "/tmp/.bingwp.$md5" ] || erexit "Failed to obtain https://www.bing.com/$image"
set_wallpaper
