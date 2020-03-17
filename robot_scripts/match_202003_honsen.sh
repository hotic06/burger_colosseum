#!/bin/bash

# directory configuration
SCRIPT_DIR=$(cd $(dirname $0); pwd)
BURGER_DIR=~/catkin_ws
JUDGE_IP=192.168.0.100


bash ${BURGER_DIR}/src/burger_war/judge/test_scripts/set_running.sh ${JUDGE_IP}:5000

roslaunch ${SCRIPT_DIR}/../launch/final_red.launch

