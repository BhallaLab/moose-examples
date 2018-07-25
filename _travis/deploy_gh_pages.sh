#!/usr/bin/env bash
INDEXMD='index.md'
FAILEDTXT=$(cat FAILED)
cat <<-EOF >> $INDEXMD 
Following scripts failed.

$FAILEDTXT
EOF

# generate site
bundle exec jekyll build
bundle exec htmlproofer ./_site
