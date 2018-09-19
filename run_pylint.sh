#!/usr/bin/env bash
set -e
PYLINT="python3 -m pylint -E --disable=no-member --disable=no-name-in-module \
    --disable=invalid-unary-operand-type"
FILES=$(find . -type f -name "*.py" | shuf)
for f in $FILES; do 
    echo "Checking $f"
    DIR=$(dirname $f)
    SNAME=$(basename $f)
    ( 
        cd $DIR
        $PYLINT $@ $SNAME
    )
done
