#!/bin/bash

FFMPEG_PS=`ps ax | grep ffmpeg | grep -v grep | grep -v wait_ffmpeg.sh | wc -l`
echo $FFMPEG_PS
while [ $FFMPEG_PS -ge "1" ]
do
    echo waiting
    sleep 1
    FFMPEG_PS=`ps ax | grep ffmpeg | grep -v grep | grep -v wait_ffmpeg.sh | wc -l`
    echo $FFMPEG_PS
done
