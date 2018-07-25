#!/usr/bin/env bash
mkdir -p _temp
( 
    cd _temp && cmake .. && make -j4 
    echo "We did not run following scripts"

    echo "Following scripts ran successfully"
    cat ./SUCCEEDED
    echo "Following scripts failed"
    cat ./FAILED 
    echo "Following scripts timed-out"
    cat ./TIMEOUT

)
