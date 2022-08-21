#!/bin/bash

#------------------------------------------
# Purpose:
# Created Date:  Wednesday 17 August 2022 04:11:31 PM IST
# © Author: Harsh Panchal

# Modify this script for your own purposes.

# Usage:
#------------------------------------------

if [ ! -f "$TMPDIR/stopwatch-start.txt" ]
then
    echo "No stopwatch currently existed"
    exit 1
fi

NOW=$(date +"%s")
START=$(<"$TMPDIR/stopwatch-start.txt")
DIFF=$((NOW - START))

if [[ $DIFF -lt 60 ]]
then
    printf '%02ds' $((DIFF%60))
elif [[ $DIFF -lt 3600 ]]
then
    printf '%02dm:%02ds' $((DIFF%3600/60)) $((DIFF%60))
else
    printf '%02dh:%02dm:%02ds' $((DIFF/3600)) $((DIFF%3600/60)) $((DIFF%60))
fi
