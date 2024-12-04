#!  /bin/bash

source paths.sh
# package lists
PKGLIST=$SCRIPT_DIR/pkglist
PKGLIST_SNAP=$SCRIPT_DIR/pkglist_snap
# This script will setup an Ubuntu 24.04 system on a Lattepanda Sigma

# update system
sudo apt update 1>/dev/null 2>/dev/null
sudo apt install software-properties-common curl -y
sudo add-apt-repository universe -y
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
sudo apt update 1>/dev/null 2>/dev/null
sudo apt full-upgrade -y
sudo apt autoremove -y

# apt
xargs sudo apt install -y < "$PKGLIST"


# snap store
sudo snap install bash-language-server --classic

# pip

#pip install -r requirements.txt


