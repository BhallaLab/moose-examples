#!/usr/bin/env bash

PWD=$(cd "$(dirname "${BASH_SOURCE[0]}" )" && pwd)

BLACKLISTED=$PWD/BLACKLISTED
SUCCEEDED=$PWD/SUCCEEDED
FAILED=$PWD/FAILED
TEMP=$PWD/__temp__

rm -f $BLACKLISTED $SUCCEEDED $FAILED $TEMP TORUN
$PWD/find_scripts_to_run.sh 

PYC=`which python`
MATPLOTRC=$PWD/matplotlibrc
if [ ! -f $MATPLOTRC ]; then
    echo "$MATPLOTRC not found"
    exit
fi


for f in `cat ./TORUN`; do
    d=`dirname $f`
    fn=`basename $f`
    (
        cp $MATPLOTRC $d/
        cd $d
        echo "++ Executing script $f"
        # Do not run more than 2 minutes. 
        timeout 2m $PYC $fn &> $TEMP
        if [ $? -eq 0 ]; then                   # success
            echo "|| Success. Written to $SUCCEEDED"
            echo "- [x] $f" >> $SUCCEEDED
        elif [ $? -eq 124 ]; then               # timeout
            # If there is timeout then add to BLACKLISTED
            echo "- [ ] $f" >> $BLACKLISTED
            sed -i 's/^/\ \ /' $TEMP
            printf "\n\`i\`\`\n" >> $BLACKLISTED 
            cat $TEMP >> $BLACKLISTED 
            printf "\`\`\`\n" >> $BLACKLISTED 
            echo "|| Took too much time. Blacklisted";
        else                                    # Failed
            echo "- [ ] $f" >> $FAILED
            sed -i 's/^/\ \ /' $TEMP
            printf "\n\`\`\`\n" >> $FAILED 
            cat $TEMP >> $FAILED 
            printf "\`\`\`\n" >> $FAILED 
            echo "|| Failed. Error written to $FAILED"
        fi
    )
done

echo "Following scripts were successful"
cat $SUCCEEDED

if [ -f $BLACKLISTED ]; then
    echo "Following scripts were blacklisted due to timeout"
    cat $BLACKLISTED 
fi

if [ -f $FAILED ]; then 
    echo "=========================================="
    echo "Following scripts failed."
    cat $FAILED
    exit 1
fi

## If less than 84 files passed, raise and error.
