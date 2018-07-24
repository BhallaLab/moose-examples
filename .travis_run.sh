#!/usr/bin/env bash
mkdir -p _temp
( cd _temp && cmake .. && make -j4 )
