#!/bin/bash

gfx_driver=`lshw -c video | awk '/configuration: driver/{print $2}' | cut -d '=' -f 2`
