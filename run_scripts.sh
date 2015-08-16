#!/bin/bash
# Run scripts in ./TORUN file

if [ ! -f ./TORUN ]; then
    ./find_scripts_to_run.sh 
fi

PYC=`which python`
MATPLOTRC=./_travis/matplotlibrc
BLACKLISTED=./BLACKLISTED

for f in `cat ./TORUN`; do
    d=`dirname $f`
    fn=`basename $f`
    (
        cd $d
        cp $MATPLOTRC $d/
        $PYC $fn >> __run__log.txt || echo "$1" >> $BLACKLISTED
    )
done

