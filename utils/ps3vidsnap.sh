#!/bin/sh

/usr/bin/raspivid -o /rpicopter/cam/video-$1.h264 -vf -hf -w 1280 -h 720 -fps 25 -b 5000000 -t 30000 &

