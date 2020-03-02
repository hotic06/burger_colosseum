#!/bin/bash

AUTO_DIR=$(cd $(dirname $0); pwd)
SCRIPT_DIR=${AUTO_DIR}/../scripts

echo $AUTO_DIR
echo $SCRIPT_DIR
(
${SCRIPT_DIR}/match_202003_yosen.sh hotic06 clubhouse
)&

python ${SCRIPT_DIR}/wait_end_game.py

bash ${SCRIPT_DIR}/kill_burger.sh

bash ${SCRIPT_DIR}/wait_ffmpeg.sh
