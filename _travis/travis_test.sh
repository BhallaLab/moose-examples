#!/usr/bin/env bash
cmake .
make -j4
make doqcs

if [ - f ./SUCCEEDED ]; then
    echo "FOLLOWING FILES HAVE SUCCEEDED"
    cat ./SUCCEEDED
fi

if [ - f ./BROKEN ]; then
    echo "FOLLOWING FILES ARE BROKEN"
    cat ./BROKEN
fi
