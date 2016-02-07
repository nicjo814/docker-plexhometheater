#!/bin/bash

gfx_driver=`lshw -c video | grep configuration | awk '/driver/{print $2}' | cut -d '=' -f 2`
