#!/usr/bin/env bash
VERSION=$(lsb_release -r | cut -f2)
sudo apt-get -y update
sudo apt-get install cmake --force-yes
sudo apt-get -y --force-yes install python-qt4 python-pip graphviz
sudo apt-get -y --force-yes install python-h5py python-scipy python-pygraphviz
wget -nv https://download.opensuse.org/repositories/home:moose/xUbuntu_$VERSION/Release.key -O Re    lease.key
sudo apt-key add - < Release.key
cat <<EOF > /etc/apt/sources.list.d/home:moose.list 
deb http://download.opensuse.org/repositories/home:/moose/xUbuntu_${VERSION}/ /
EOF
sudo apt-get update
sudo apt-get install pymoose
