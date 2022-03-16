#!/usr/bin/env sh


## 1 the git clone may be failed due to the network, try more.
git clone https://github.com/ros/rosdistro.git ~/code/rosdistro

## 2 replace the clone rosdistro 20-default.list with local address.
sed -i "s#https://raw.githubusercontent.com/ros/rosdistro/master#file:///home/leo/code/rosdistro#g" ~/code/rosdistro/rosdep/sources.list.d/20-default.list

## 3 replace the /usr/lib files "https://raw.githubusercontent.com/ros/ros/rosdistro/master " with local address
sudo sed -i "s#https://raw.githubusercontent.com/ros/rosdistro/master#file:///home/leo/code/rosdistro#g" /usr/lib/python3/dist-packages/rosdep2/sources_list.py
sudo sed -i "s#https://raw.githubusercontent.com/ros/rosdistro/master#file:///home/leo/code/rosdistro#g" /usr/lib/python3/dist-packages/rosdep2/rep3.py
sudo sed -i "s#https://raw.githubusercontent.com/ros/rosdistro/master#file:///home/leo/code/rosdistro#g" /usr/lib/python3/dist-packages/rosdistro/__init__.py

## 4 copy 20-default.list file

sudo cp ~/code/rosdistro/rosdep/sources.list.d/20-default.list /etc/ros/rosdep/sources.list.d

## 5 rosdep update
rosdep update
