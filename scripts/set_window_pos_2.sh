#!/bin/bash

# Set Window size and positions for RVIZ

DESKTOPWIDTH=`xdpyinfo  | grep -oP 'dimensions:\s+\K\S+' | cut -f 1 -d "x"`
DESKTOPHEIGHT=`xdpyinfo  | grep -oP 'dimensions:\s+\K\S+' | cut -f 2 -d "x"`

RVIZSIZE_org="1200 600"
RVIZSIZE=400

RVIZWIN1=`xdotool search -onlyvisible ".*Rviz" | head -1`

if [ ${#RVIZWIN1} -gt 0 ]; then
xdotool windowactivate ${RVIZWIN1}
wmctrl -r :ACTIVE: -b remove,maximized_vert,maximized_horz

xdotool windowsize ${RVIZWIN1} $RVIZSIZE_org
xdotool windowmove ${RVIZWIN1} 10 10

xdotool mousemove 500 500
xdotool click 5
sleep 0.5
xdotool click 5
sleep 0.5
xdotool click 5
sleep 0.5
xdotool click 5
sleep 0.5
xdotool mousemove 450 500
xdotool click 1
sleep 0.2
xdotool windowsize ${RVIZWIN1} ${RVIZSIZE} ${RVIZSIZE}
xdotool windowmove ${RVIZWIN1} 10 320
fi


GAZEBOWIN=`xdotool search -onlyvisible Gazebo`
xdotool windowactivate ${GAZEBOWIN}


if [ -n $RVIZWIN1 ]; then
xdotool windowactivate ${RVIZWIN1}
fi

JUDGE=`xdotool search -onlyvisible Onigiri`
xdotool windowactivate ${JUDGE}

TERMINALS=`xdotool search -onlyvisible gnome-terminal`
for WINID in ${TERMINALS} ; do
 xdotool windowminimize ${WINID}
done

