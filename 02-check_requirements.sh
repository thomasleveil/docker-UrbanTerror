#!/bin/sh

## make sure we got a config file
if [ ! -f "/q3ut4/server.cfg" ]; then
    echo "WARNING: no UrT server config file found, copying default config" 1>&2 
    sed -r 's/(^set\s+sv_hostname\s+).+/\1"docker-'$HOSTNAME'"/' /home/urt/UrbanTerror42/q3ut4/server_example.cfg > /q3ut4/server.cfg
fi

