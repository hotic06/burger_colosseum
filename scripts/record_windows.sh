#!/bin/bash

DESKTOPWIDTH=`xdpyinfo  | grep -oP 'dimensions:\s+\K\S+' | cut -f 1 -d "x"`
DESKTOPHEIGHT=`xdpyinfo  | grep -oP 'dimensions:\s+\K\S+' | cut -f 2 -d "x"`


TMP_DIR=/mnt/tmp
sudo mkdir -p ${TMP_DIR}
sudo chmod 777 ${TMP_DIR}


WLIST=`wmctrl -l`

XID_GAZEBO=`echo "$WLIST" | grep Gazebo | awk '{print $1}'`
XID_JUDGE=`echo "$WLIST" | grep 'Onigiri War' | awk '{print $1}'`
XID_RVIZ=`echo "$WLIST" | grep 'RViz' | awk '{print $1}'`
XID_TERMINAL=`echo "$WLIST" | grep 'final_red.launch' | awk '{print $1}'`
XID_RQT=`echo "$WLIST" | grep 'rqt_image_view' | awk '{print $1}'| head -1`


(gst-launch-1.0 ximagesrc xid=$XID_GAZEBO ! queue ! video/x-raw,framerate=10/1 ! jpegenc ! avimux ! filesink location="${TMP_DIR}/01.avi")&
(gst-launch-1.0 ximagesrc xid=$XID_JUDGE ! queue ! video/x-raw,framerate=1/1 ! jpegenc ! avimux ! filesink location="${TMP_DIR}/02.avi")&
#(gst-launch-1.0 ximagesrc xid=$XID_RVIZ ! video/x-raw,framerate=10/1 ! jpegenc ! avimux ! filesink location="${TMP_DIR}/03.avi")&
#(gst-launch-1.0 ximagesrc xid=$XID_TERMINAL ! video/x-raw,framerate=10/1 ! jpegenc ! avimux ! filesink location="${TMP_DIR}/04.avi")&
(gst-launch-1.0 ximagesrc xid=$XID_RQT ! video/x-raw,framerate=10/1 ! jpegenc ! avimux ! filesink location="${TMP_DIR}/03.avi")&



(gst-launch-1.0 ximagesrc ! queue ! video/x-raw,framerate=10/1 ! jpegenc ! avimux ! filesink location="${TMP_DIR}/00.avi")&

#ffmpeg -f x11grab -y -r 10 -s ${DESKTOPWIDTH}x${DESKTOPHEIGHT} -i :0.0 -vcodec ffvhuff ${TMP_DIR}/out.avi


