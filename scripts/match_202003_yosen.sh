#!/bin/bash
set -e
set -x

# directory configuration
SCRIPT_DIR=$(cd $(dirname $0); pwd)
ONENIGHT_DIR=${SCRIPT_DIR}/../../OneNightROBOCON_ws
BURGER_DIR=~/catkin_ws


# prosess start backgreound
# please kill_onigiri.sh for kill prosess

# check arg num
if [ $# -ne 2 ]; then
    echo "ERR arguments num ERR $#"
    exit 1
fi



RED_NAME=$1
BLUE_NAME=$2

# launch Simulation 
cd $BURGER_DIR/src/burger_war
(
source ${ONENIGHT_DIR}/devel/setup.bash
export GAZEBO_MODEL_PATH=${ONENIGHT_DIR}/src/burger_war/burger_war/models/
bash ${ONENIGHT_DIR}/src/burger_war/scripts/setup_semifinal.sh $RED_NAME $BLUE_NAME
)&

# set window position and size
sleep 10
bash ${SCRIPT_DIR}/set_window_pos.sh
sleep 5


# launch your_burger as red side
(    
source ${BURGER_DIR}/devel/setup.bash
date +%H%M%S_%N
roslaunch ${SCRIPT_DIR}/../launch/final_red.launch
)&

# launch enemy as blue side
(
source ${ONENIGHT_DIR}/devel/setup.bash
date +%H%M%S_%N
roslaunch ${SCRIPT_DIR}/../launch/final_blue.launch
)&



# set judge server state "running"
bash ${BURGER_DIR}/src/burger_war/judge/test_scripts/set_running.sh localhost:5000


# set window position
sleep 5
bash ${SCRIPT_DIR}/set_window_pos_2.sh
