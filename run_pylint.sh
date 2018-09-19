#!/usr/bin/env bash
set -e
PYLINT="pylint -E --disable=no-member --disable=no-name-in-module"
FILES=$(find . -type f -name "*.py")
for f in $FILES; do 
    echo "Checking $f"
    $PYLINT $@ $f 
done
