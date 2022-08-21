#!/bin/bash

#------------------------------------------
# Purpose:
# Created Date:  Thursday 18 August 2022 09:40:15 PM IST
# © Author: Harsh Panchal

# Modify this script for your own purposes.

# Usage:
#------------------------------------------

function progress(){

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
}

if [[ $# > 1 ]]
then
    echo "Usage:    stopwatch [--start|--stop|--prog]"
    exit 1
fi

case $1 in

    --start)
        if [ -f "$TMPDIR/stopwatch-start.txt" ]
        then
            echo "A stopwatch is already started" > /dev/stderr
            exit 1
        fi

        date +"%s" > "$TMPDIR/stopwatch-start.txt"
        echo "Stopwatch started!"
        ;;

    --stop)
        PROGRESS=$(progress)
        rm "$TMPDIR/stopwatch-start.txt" 2>/dev/null

        pbcopy <<< "$PROGRESS" 2>/dev/null # pbcopy is an alias for 'xclip -selection clipboard'

        echo "Final Time -> $PROGRESS"
        ;;

    --prog)
        progress
        ;;
    *)
    echo "Usage:    stopwatch [--start|--stop|--prog]"
    ;;
esac
