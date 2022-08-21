#!/bin/bash

#------------------------------------------
# Purpose:
# Created Date:  Wednesday 17 August 2022 04:09:25 PM IST
# © Author: Harsh Panchal

# Modify this script for your own purposes.

# Usage:
#------------------------------------------

set -e

PROGRESS=$(./stopwprogress)
rm "$TMPDIR/stopwatch-start.txt"

pbcopy < "$PROGRESS"

echo "Final Time -> $PROGRESS"
