#!/usr/bin/env bash
( cd _travis && cmake . && make -j3 )
( cd _travis && python deploy_gh_pages.py )
