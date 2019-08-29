
# Turtlebot3のモデル名の指定が必要
echo "export TURTLEBOT3_MODEL=burger" >> ~/.bashrc

# パッケージをインストール(Ref: http://emanual.robotis.com/docs/en/platform/turtlebot3/pc_setup/#install-dependent-ros-packages )
sudo apt-get install ros-kinetic-joy ros-kinetic-teleop-twist-joy ros-kinetic-teleop-twist-keyboard ros-kinetic-laser-proc ros-kinetic-rgbd-launch ros-kinetic-depthimage-to-laserscan  ros-kinetic-rosserial-arduino ros-kinetic-rosserial-python ros-kinetic-rosserial-server ros-kinetic-rosserial-client ros-kinetic-rosserial-msgs ros-kinetic-amcl ros-kinetic-map-server ros-kinetic-move-base ros-kinetic-urdf ros-kinetic-xacro ros-kinetic-compressed-image-transport ros-kinetic-rqt-image-view ros-kinetic-gmapping ros-kinetic-navigation ros-kinetic-interactive-markers



#@Takada Seigo 
sudo apt-get install ros-kinetic-dwa-local-planner



#@Irie Eiji
wget https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py
pip install --user --upgrade tensorflow

pip install  keras --user


#@yokota.shiori
sudo apt install ros-kinetic-dwa-local-planner
sudo apt install ros-kinetic-jsk-rviz-plugins
sudo apt install ros-kinetic-smach*


sudo apt install ros-kinetic-libg2o

