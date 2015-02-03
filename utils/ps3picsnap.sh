#!/bin/sh

/usr/bin/raspistill -o /rpicopter/cam/image-$1.jpg  -hf -vf -w 1024 -h 768 -ex sports &

