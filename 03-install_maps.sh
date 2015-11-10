#!/bin/sh

## install additional maps
if [ -d "/maps" ]; then
    echo -e "\n========================== installing additional maps =========================="
    cp -vf /maps/*.pk3 /home/urt/UrbanTerror42/q3ut4
fi
