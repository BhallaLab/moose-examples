#!/usr/bin/env bash
"export DISPLAY=:99.0"
"sh -e /etc/init.d/xvfb start"
sleep 2
sudo apt install -yy python3-pip python3-setuptools python3-dev
# We use python3 to run the travis scripts. Which requires subprocess32 modules.
/usr/bin/python3 -m pip install subprocess32 --user
