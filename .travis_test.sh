#!/usr/bin/env bash
# Launch in paralle.
( cd _travis && ./download_and_run_doqcs.sh ) &
( cd _travis && ./find_scripts_to_run.sh && ./run_scripts.sh ) &
wait
