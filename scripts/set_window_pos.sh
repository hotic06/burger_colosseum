#!/bin/bash

# Set windows position for Gazebo and JUDGE Window.
# Minimize windows of gnome-terminal(s)

TERMINALS=`xdotool search -onlyvisible gnome-terminal`
for WINID in ${TERMINALS} ; do
 xdotool windowminimize ${WINID}
done

GAZEBOWIN=`xdotool search -onlyvisible Gazebo`
xdotool windowactivate ${GAZEBOWIN}
wmctrl -r Gazebo -b remove,maximized_vert,maximized_horz
xdotool windowsize ${GAZEBOWIN} 1000 700
xdotool windowmove ${GAZEBOWIN} 10 10
sleep 0.2
xdotool mousemove 995 90
xdotool click 1
sleep 0.2
xdotool mousemove_relative 50 40 
xdotool click 1
sleep 1.5
xdotool click 1
sleep 2.0

xdotool mousemove 340 380
sleep 0.2
xdotool click 1
sleep 0.2
xdotool mousedown 1
sleep 0.2
xdotool mousemove 100 380
sleep 0.2
xdotool mouseup 1
sleep 0.2

xdotool mousemove 575 400
xdotool mousedown 2
sleep 0.5
xdotool mousemove_relative 0 50
sleep 0.5
xdotool mousemove_relative -- 225 0
sleep 0.5
xdotool mouseup 2


xdotool mousemove 575 400
sleep 0.2
xdotool click 1
sleep 1.0
xdotool click 1
sleep 0.5
xdotool click 4
sleep 0.4
xdotool click 4
sleep 0.4
xdotool click 4
sleep 0.4
xdotool click 4


xdotool windowsize ${GAZEBOWIN} 700 700


#xdotool windowsize ${GAZEBOWIN} 85% 100%
#xdotool windowmove ${GAZEBOWIN} 130 10

JUDGE=`xdotool search -onlyvisible Onigiri`
xdotool windowactivate ${JUDGE}
xdotool windowmove ${JUDGE} 0 10

RQT=`xdotool search -onlyvisible rqt_image_view | head -1`
xdotool windowactivate ${RQT}
xdotool windowsize ${RQT} 500 500
xdotool windowmove ${RQT} 780 0

