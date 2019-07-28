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


cd ~/wss/dashimaki360_ws/src/onigiri_war
(
# setup red workspace
source ~/wss/dashimaki360_ws/devel/setup.bash
export GAZEBO_MODEL_PATH=$HOME/wss/dashimaki360_ws/src/onigiri_war/onigiri_war/models/
bash ~/wss/dashimaki360_ws/src/onigiri_war/scripts/sim_with_judge.sh $RED_NAME $BLUE_NAME
)&

sleep 15


# launch your_onigiri as red side
if [ -f ~/wss/${RED_NAME}_ws/src/onigiri_war/onigiri_war/launch/your_onigiri_red_nongroup.launch ]; then
    (
    source ~/wss/${RED_NAME}_ws/devel/setup.bash
    date +%H%M%S_%N
    roslaunch ~/final_red.launch nongroup:="true"
    )&
else
    (
    source ~/wss/${RED_NAME}_ws/devel/setup.bash
    date +%H%M%S_%N
    roslaunch ~/final_red.launch nongroup:="false"
    )&
fi


# launch your_onigiri as blue side
if [ -f ~/wss/${BLUE_NAME}_ws/src/onigiri_war/onigiri_war/launch/your_onigiri_blue_nongroup.launch ]; then
    (
    source ~/wss/${BLUE_NAME}_ws/devel/setup.bash
    date +%H%M%S_%N
    roslaunch ~/final_blue.launch nongroup:="true"
    )&
else
    (
    source ~/wss/${BLUE_NAME}_ws/devel/setup.bash
    date +%H%M%S_%N
    roslaunch ~/final_blue.launch nongroup:="false"
    )&
fi

# set judge server state "running"
bash onigiri_war_judge/test_scripts/set_running.sh localhost:5000

