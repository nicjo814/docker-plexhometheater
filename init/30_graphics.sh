#!/bin/bash
cd /tmp

gfx_driver=`lshw -c video | awk '/configuration: driver/{print $2}' | cut -d '=' -f 2`
case $gfx_driver in
    nvidia )
        echo "NVIDIA Driver detected on host system"
        gfx_version=`cat /proc/driver/nvidia/version | head -n 1 | awk '{ print $8 }'`
        echo "NVIDIA driver version on host system is $gfx_version"
        if [ ! -f "/usr/share/nvidia/nvidia-application-profiles-${gfx_version}-rc" ]; then
                echo "Downloading new NVIDIA driver version ${gfx_version}"
                nvidia_driver_uri=http://us.download.nvidia.com/XFree86/Linux-x86_64/${gfx_version}/NVIDIA-Linux-x86_64-${gfx_version}.run
                curl -O $nvidia_driver_uri
        else
                echo "NVIDIA driver ${gfx_version} already installed"
        fi
        ;;
    ati_placeholder )
        ;;
esac
