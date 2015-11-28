#!/usr/bin/env bash
# Run scripts in ./TORUN file
set -x
PWD=$(cd "$(dirname "${BASH_SOURCE[0]}" )" && pwd)

if [ ! -f ./TORUN ]; then
    $PWD/find_scripts_to_run.sh 
fi

PYC=`which python`
MATPLOTRC=$PWD/matplotlibrc
if [ ! -f $MATPLOTRC ]; then
    echo "$MATPLOTRC not found"
    exit
fi
BLACKLISTED=$PWD/BLACKLISTED

for f in `cat ./TORUN`; do
    d=`dirname $f`
    fn=`basename $f`
    (
        cp $MATPLOTRC $d/
        cd $d
        # Do not run more than a minute. 
        timeout 1m $PYC $fn || echo "$1" >> $BLACKLISTED
    )
done

