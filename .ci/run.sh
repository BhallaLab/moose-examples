#!/usr/bin/env bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
python3 -m pip install pip --upgrade
python3 -m pip install pymoose --pre --upgrade 
python3 -m pip install -r .ci/requirements.txt 
python3 -m pip install numpy --upgrade 
python3 $SCRIPT_DIR/execute_travis_serial.py -n 60
