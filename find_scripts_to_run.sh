#!/bin/bash
source ./colors.sh

# matplotlibrc file.
MATPLOTRC=./_travis/matplotlibrc

PWD=$(cd "$(dirname "${BASH_SOURCE[0]}" )" && pwd)
MAINLESS=$PWD/MAINLESS
BLACKLISTED=$PWD/BLACKLISTED
GUI=$PWD/GUISCRIPTS
INTERACTIVE=$PWD/INTERACTIVE
TORUN=$PWD/TORUN

for f in $MAINLESS $BLACKLISTED $GUI $INTERACTIVE $TORUN; do
    # Remove already existing files
    if [ -f $f ]; then
        rm -f $f
    fi
done

declare -i a
PYC=`which python`

function check_file
{
    filepath="$1"
    if grep -q "input(" $filepath
    then
        coloredPrint WARN "File contains input() call. Interactive script. WONT
        RUN"
        echo $filepath >> $INTERACTIVE
    elif grep -q "QtGui" $filepath
    then
        coloredPrint WARN "File seems to be a GUI. WONT RUN"
        echo $filepath >> $GUI
    elif grep -q "__main__\|main(" $filepath
    then
        coloredPrint "INFO" "Script with main() or __main__"
        echo $filepath >> $TORUN
    fi
}

PYFILES=`find . -name "*.py"`
for pyf in $PYFILES; do
    let a=a+1
    dn=`dirname $pyf`
    fn=`basename $pyf`
    # copy matplotlibrc file to working directory
    check_file $pyf
done

# Run those files which are stored in $TORUN script.
for f in `cat $TORUN`; do
    basedir=`dirname $f`
    filename=`basename $f`
    cp $MATPLOTRC $basedir
    (
        coloredPrint INFO "Running file $f"
        cd $basedir 
        #$PYC $filename | tee  __run__.log || echo "$f" >> FAILED
    )
done
