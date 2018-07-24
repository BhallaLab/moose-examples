#!/usr/bin/env bash
sudo apt-get -y update
sudo apt-get install cmake --force-yes
sudo apt-get -y --force-yes install python-qt4 python-pip graphviz
sudo apt-get -y --force-yes install python-h5py python-scipy python-pygraphviz
sudo pip install python-libsbml networkx matplotlib numpy --upgrade
sudo pip install pymoose numpy 
