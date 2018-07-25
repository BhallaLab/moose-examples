#!/usr/bin/env bash
INDEXMD='./README.md'
FAILEDTXT=$(cat FAILED)
SUCCESSTXT=$(cat SUCCEEDED)

SUCCESSTXT=""
if [[ -f SUCCEEDED ]]; then
    SUCCESSTXT=$(cat SUCCEEDED)
fi

BROKENTXT=""
if [[ -f BROKEN ]]; then
    BROKENTXT=$(cat BROKEN)
fi

BLACKLISTEDTXT=''
if [[ -f BLACKLISTED ]]; then
    #statements
    BLACKLISTEDTXT=$(cat BLACKLISTED)
fi

cat <<-EOF >> $INDEXMD 
# Successful scripts

These scripts ran successfully.

$SUCCESSTXT

# Failed scripts

These scripts failed to execute successfully on Travis.

$FAILEDTXT

# Broken scripts

These scripts are marked `BROKEN` by one or more developers.

$BROKENTXT

# Blacklist script

This scripts were not tested because they require human interaction.

$BLACKLISTEDTXT

EOF

# remove all files.
git clean -fxd .
