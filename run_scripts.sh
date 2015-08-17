#!/bin/bash
# Run scripts in ./TORUN file
set -x
PWD=$(cd "$(dirname "${BASH_SOURCE[0]}" )" && pwd)

if [ ! -f ./TORUN ]; then
    $PWD/find_scripts_to_run.sh 
fi

PYC=`which python`
MATPLOTRC=$PWD/_travis/matplotlibrc
BLACKLISTED=$PWD/BLACKLISTED

for f in `cat ./TORUN`; do
    d=`dirname $f`
    fn=`basename $f`
    (
        cp $MATPLOTRC $d/
        cd $d
        $PYC $fn | tee __run__log.txt || echo "$1" >> $BLACKLISTED
    )
done

