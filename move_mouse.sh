#!/bin/bash

get_idle_time=`dbus-send --print-reply --dest=org.gnome.Mutter.IdleMonitor /org/gnome/Mutter/IdleMonitor/Core org.gnome.Mutter.IdleMonitor.GetIdletime`
IDLE_TIMEE=$(echo $get_idle_time | awk '{print $NF}')
echo "IDLE TIME1: ${IDLE_TIMEE}" >> ~/move_mouse.log



# Get the idle time in milliseconds
IDLE_TIME=$(xprintidle)
echo  "IDLE TIME2: ${IDLE_TIME}" >> ~/move_mouse.log
# Convert 2 minutes to milliseconds (2 minutes * 60 seconds * 1000 milliseconds)
#MAX_IDLE_TIME=$((1 * 60 * 1000))
MAX_IDLE_TIME=1000
echo  "MAX IDLE TIME: ${MAX_IDLE_TIME}" >> ~/move_mouse.log

# Check if idle timome is greater than or equal to 2 minutes
if [ "$IDLE_TIME" -ge "$MAX_IDLE_TIME" ]; then
    # Get the current mouse position
    CURRENT_X=$(xdotool getmouselocation --shell | grep X= | awk -F= '{print $2}')
    CURRENT_Y=$(xdotool getmouselocation --shell | grep Y= | awk -F= '{print $2}')

    # Move the mouse slightly to the right and then back
    xdotool mousemove $((CURRENT_X+100)) $((CURRENT_Y+100))
    xdotool mousemove $((CURRENT_X+100)) $((CURRENT_Y-50))
    xdotool mousemove $((CURRENT_X-50)) $((CURRENT_Y+100))
    xdotool mousemove $((CURRENT_X+100)) $((CURRENT_Y+100))
    xdotool keydown Shift
    sleep 1
    xdotool keyup Shift
    sleep 1
    xdotool keydown Control
    sleep 1
    xdotool keyup Control

    xdotool mousemove $((CURRENT_X+100)) $((CURRENT_Y+100))
    xdotool mousemove $((CURRENT_X+100)) $((CURRENT_Y-50))
    xdotool mousemove $((CURRENT_X-50)) $((CURRENT_Y+100))
    xdotool mousemove $((CURRENT_X+100)) $((CURRENT_Y+100))
    xdotool keydown Shift
    sleep 1
    xdotool keyup Shift
    sleep 1
    xdotool keydown Control
    sleep 1
    xdotool keyup Control

    xdotool mousemove $((CURRENT_X+100)) $((CURRENT_Y+100))
    xdotool mousemove $((CURRENT_X+100)) $((CURRENT_Y-50))
    xdotool mousemove $((CURRENT_X-50)) $((CURRENT_Y+100))
    xdotool mousemove $((CURRENT_X+100)) $((CURRENT_Y+100))
    xdotool keydown Shift
    sleep 1
    xdotool keyup Shift
    sleep 1
    xdotool keydown Control
    sleep 1
    xdotool keyup Control

    xdotool mousemove $CURRENT_X $CURRENT_Y
fi
