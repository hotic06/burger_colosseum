#!/bin/bash
set -e
set -x

# prosess start backgreound
# please kill_onigiri.sh for kill prosess

ACCOUNT_NAME=$1

# if acount name head is "#" skip script
# "#" means comment
if [[ ${ACCOUNT_NAME} == "#"* ]]; then
    exit
fi

cd ~/wss/${ACCOUNT_NAME}_ws/src/onigiri_war

source ~/wss/${ACCOUNT_NAME}_ws/devel/setup.bash

# setup workspace
source ~/wss/${ACCOUNT_NAME}_ws/devel/setup.bash
export GAZEBO_MODEL_PATH=$HOME/wss/${ACCOUNT_NAME}_ws/src/onigiri_war/onigiri_war/models/

bash ~/wss/${ACCOUNT_NAME}_ws/src/onigiri_war/scripts/sim_with_judge.sh&

sleep 5

bash ~/wss/${ACCOUNT_NAME}_ws/src/onigiri_war/scripts/start.sh

