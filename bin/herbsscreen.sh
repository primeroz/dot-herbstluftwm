#!/bin/bash

selected=$(echo -e "single\ndual-hdmi-top\ndual-hdmi-right\ndual-hdmi-right-vert" | rofi -dmenu -p "DISPLAY: " -i -theme /usr/share/rofi/themes/Arc.rasi )

[[ -z $selected ]] && exit 0

case "$selected" in
    single)
        xrandr --output HDMI2 --off --output HDMI1 --off --output DP1 --off --output eDP1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off
        ;;
    dual-hdmi-top)
        xrandr --output HDMI2 --off --output HDMI1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP1 --off --output eDP1 --primary --mode 1920x1080 --pos 0x1080 --rotate normal --output VIRTUAL1 --off
        ;;
    dual-hdmi-right)
        xrandr --output HDMI2 --off --output HDMI1 --mode 1920x1080 --pos 1920x0 --rotate normal --output DP1 --off --output eDP1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off
        ;;
    dual-hdmi-right-vert)
        xrandr --output HDMI2 --off --output HDMI1 --mode 1920x1080 --pos 1920x0 --rotate left --output DP1 --off --output eDP1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off
        ;;
    *)
        exit 2
esac

exit 0
