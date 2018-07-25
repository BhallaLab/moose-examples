#!/usr/bin/env bash
mkdir -p _temp
( 
    cd _temp && cmake -DPYTHON_EXECUTABLE=/usr/bin/python .. && make -j4 
    echo "We did not run following scripts"

    if [[ -f SUCCEEDED ]]; then
        echo "Following scripts ran successfully"
        cat ./SUCCEEDED
    fi

    if [ -f FAILED ]; then
        echo "Following scripts failed"
        cat ./FAILED 
    fi

    if [ -f TIMEOUT ]; then
        echo "Following scripts timed-out"
        cat ./TIMEOUT
    fi

)
