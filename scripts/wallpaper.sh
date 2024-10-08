#!/bin/bash

erexit() {
    echo "$*"
    exit
}

[[ " $@ " =~ " force " ]] && rm /tmp/.bingwp.*

offset=$(( RANDOM % 8 ))
# Generamos offset aleatorio si no nos llega.
[[ "$1" =~ [1-9][0-9]*$ ]] && offset=$1

# Locale rrandom.
markets=( es-Es ca-Es zh-CN en-US ja-JP en-AU en-UK de-DE en-NZ en-CA )
e=${markets[RANDOM%${#markets[@]}]}

echo "market: $e"
echo "offset: $offset"

market=${e}
# market=${e:-en-US}
# market=${market%.*}
# market=${market/_/-}
url="https://www.bing.com/HPImageArchive.aspx?idx=${offset}&n=1&mkt=${market}"
# url="https://picsum.photos/3840/2160/?random"
echo "url: $url"
read data < <(curl -s "$url")

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
