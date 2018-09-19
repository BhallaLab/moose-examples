#!/usr/bin/env bash
set -e
PYLINT="pylint -E --disable=no-member --disable=no-name-in-module \
    --disable=invalid-unary-operand-type"
FILES=$(find . -type f -name "*.py" | shuf)
for f in $FILES; do 
    echo "Checking $f"
    $PYLINT $@ $f 
done
