#!/bin/sh

## make sure we got a config file
if [ ! -f "/q3ut4/server.cfg" ]; then
    echo "ERROR: expecting docker container to have file /q3ut4/server.cfg" 1>&2 
    exit 1
fi

