#!/bin/bash
set -e
set -x

# prosess start backgreound
# please kill_onigiri.sh for kill prosess

# check arg num
if [ $# -ne 2 ]; then
    echo "ERR arguments num ERR $#"
    exit 1
fi


RED_NAME=$1
BLUE_NAME=$2


cd ~/wss/OneNightROBOCON_ws/src/burger_war
(
# setup red workspace
source ~/wss/OneNightROBOCON_ws/devel/setup.bash
export GAZEBO_MODEL_PATH=$HOME/wss/OneNightROBOCON_ws/src/burger_war/burger_war/models/
bash ~/wss/OneNightROBOCON_ws/src/burger_war/scripts/setup_semifinal.sh $RED_NAME $BLUE_NAME
)&

sleep 15


# launch your_onigiri as red side
(
source ~/wss/${RED_NAME}_ws/devel/setup.bash
date +%H%M%S_%N
roslaunch ~/burger_colosseum/launch/final_red.launch
)&


# launch your_onigiri as blue side
(
source ~/wss/${BLUE_NAME}_ws/devel/setup.bash
date +%H%M%S_%N
roslaunch ~/burger_colosseum/launch/final_blue.launch
)&

# set judge server state "running"
bash ~/wss/OneNightROBOCON_ws/src/burger_war/judge/test_scripts/set_running.sh localhost:5000

