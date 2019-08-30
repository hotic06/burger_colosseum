cd ~/wss/OneNightROBOCON_ws/src/burger_war
source ~/wss/OneNightROBOCON_ws/devel/setup.bash

IPADDR=192.168.27.200
echo side:$1
echo player_name:$2

roslaunch burger_war setup.launch ip:=$IPADDR side:=$1 player_name:=$2
