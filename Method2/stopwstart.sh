#!/bin/bash

#------------------------------------------
# Purpose:
# Created Date:  Wednesday 17 August 2022 04:07:08 PM IST
# © Author: Harsh Panchal

# Modify this script for your own purposes.

# Usage:
#------------------------------------------

if [ -f "$TMPDIR/stopwatch-start.txt" ]
then
    echo "A stopwatch is already started" > /dev/stderr
    exit 1
fi

date +"%s" > "$TMPDIR/stopwatch-start.txt"
echo "Stopwatch started!"
