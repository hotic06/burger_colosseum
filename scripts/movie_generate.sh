#!/bin/bash

movie_length(){
   ffprobe -show_streams $1 2> /dev/null | grep duration= | cut -d = -f2
}

get_challenger_name(){
   ls ~/*cheese.mp4 | head -1 | sed -e "s/\/home\/ubuntu\///" | sed -e "s/-cheese.mp4//"
}

SD=$(cd $(dirname $0); pwd)

TMP_DIR=/mnt/tmp
sudo mkdir -p ${TMP_DIR}
sudo chmod 777 ${TMP_DIR}

if [ $# -ne 1 ]; then
   CHAL_NAME=`get_challenger_name` 
else
   CHAL_NAME=$1
fi
echo ${CHAL_NAME}


${SD}/movie_add_caption.sh "チーズバーガー vs $CHAL_NAME" ~/*cheese.mp4 ${TMP_DIR}/01.mp4
                                                
${SD}/movie_add_caption.sh "てりやきバーガー vs $CHAL_NAME" ~/*teriyaki.mp4 ${TMP_DIR}/02.mp4
                                                
${SD}/movie_add_caption.sh "クラブハウス vs $CHAL_NAME" ~/*clubhouse.mp4 ${TMP_DIR}/03.mp4

cat << EOF > ${TMP_DIR}/text.text
file ${TMP_DIR}/01.mp4
file ${TMP_DIR}/02.mp4
file ${TMP_DIR}/03.mp4
EOF

ffmpeg -safe 0 -f concat -i ${TMP_DIR}/text.text -c:v copy -c:a copy -c:s copy -map 0:v ${TMP_DIR}/out.mp4

mv  ${TMP_DIR}/out.mp4 ~/${CHAL_NAME}.mp4

echo 01 `movie_length ${TMP_DIR}/01.mp4` >> ~/${CHAL_NAME}-movie_length.txt
echo 02 `movie_length ${TMP_DIR}/02.mp4` >> ~/${CHAL_NAME}-movie_length.txt
echo 03 `movie_length ${TMP_DIR}/03.mp4` >> ~/${CHAL_NAME}-movie_length.txt

