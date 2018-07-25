#!/usr/bin/env bash
INDEXMD='index.md'
FAILEDTXT=$(cat FAILED)
cat <<-EOF > $INDEXMD 
Following scripts failed.
$FAILEDTXT
EOF
