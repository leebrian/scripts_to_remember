#!/usr/bin/env bash

# I want to sync my photos directory to a mounted media volume
START_TIME=`date +%s`
rsync --archive --progress --times -vvv --delete . /Volumes/media/photos/iphoto
END_TIME=`date +%s`
echo "END TIME: " $END_TIME
echo "START TIME: " $START_TIME
ELAPSED=`expr $END_TIME - $START_TIME`
echo "ELAPSED TIME: " $ELAPSED +%H:%M:%S
echo `date -r $ELAPSED +%H:%M:%S`
echo "FINISHED at " `date` " Elapsed time:" `date -d 00:00:$ELAPSED +%H:%M:%S`
