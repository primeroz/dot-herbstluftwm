#!/bin/bash

# with openrc use loginctl
[[ $(cat /proc/1/comm) == "systemd" ]] && logind=systemctl || logind=loginctl

selected=$(echo -e "lock\nlogout\nswitch-user\nsuspend\nhibernate\nreboot\nshutdown" | rofi -dmenu -p "HERBSMANAGE: " -i -theme /usr/share/rofi/themes/Arc.rasi )

[[ -z $selected ]] && exit 0

case "$selected" in
    lock)
        blurlock
        ;;
    logout)
        herbstclient quit
        ;;
    switch_user)
        dm-tool switch-to-greeter
        ;;
    suspend)
        blurlock && $logind suspend
        ;;
    hibernate)
        blurlock && $logind hibernate
        ;;
    reboot)
        $logind reboot
        ;;
    shutdown)
        $logind poweroff
        ;;
    *)
        exit 2
esac

exit 0
