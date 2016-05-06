#!/usr/bin/env bash
# Run scripts in ./TORUN file
set -e
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
SUCCEEDED=$PWD/SUCCEEDED
FAILED=$PWD/FAILED
TEMP=$PWD/__temp__

for f in `cat ./TORUN`; do
    d=`dirname $f`
    fn=`basename $f`
    (
        cp $MATPLOTRC $d/
        cd $d
        echo "++ Executing script $f"
        # Do not run more than 2 minute. 
        timeout 2m $PYC $fn &> $TEMP
        if [ $? -eq 0 ]; then                   # success
            echo "|| Success. Written to $SUCCEEDED"
            echo "- [x] $f" >> $SUCCEEDED
        elif [ $? -eq 124 ]; then               # timeout
            # If there is timeout then add to BLACKLISTED
            echo "- [ ] $f" >> $BLACKLISTED
            sed -i 's/^/\t/' $TEMP
            cat $TEMP >> $BLACKLISTED 
            echo "|| Took too much time. Blacklisted";
        else                                    # Failed
            echo "- [ ] $f" >> $FAILED
            sed -i 's/^/\t/' $TEMP
            cat $TEMP >> $FAILED 
            echo "|| Failed. Error written to $FAILED"
        fi
    )
done

echo "Following scripts were successful"
cat $SUCCEEDED

echo "Following scripts failed"
cat $FAILED

echo "Following scripts were blacklisted due to timeout"
cat $BLACKLISTED 
