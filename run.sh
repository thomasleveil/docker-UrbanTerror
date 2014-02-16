#!/bin/sh

echoerr() { echo "$@" 1>&2; }

usage() {
    cat <<- EOF
    Start the docker container with a volume mounted to /q3ut4. 
        $ docker run -d -p 27960:27960 -v /change/me/q3ut4:/q3ut4 figurt/urt
    
    If you want additional maps, also mount a volume containing the additional pk3 map files to /maps.
        $ docker run -d -p 27960:27960 -v /change/me/q3ut4:/q3ut4 -v /change/me/my_maps:/maps figurt/urt
EOF
 
}

## check eventual 'help' argument
if [ "$1" = "-h" -o "$1" = "--help" -o "$1" = "help" ]; then
    usage
    exit 0
fi

## make sure we got a config file
if [ ! -f "/q3ut4/server.cfg" ]; then
    echoerr ERROR: expecting docker container to have file /q3ut4/server.cfg
    usage 
    exit 1
fi

## install additional maps
if [ -d "/maps" ]; then
    echo "===== installing additional maps ======"
    cp -vf /maps/*.pk3 /UrbanTerror42/q3ut4
fi

if [ $# -gt 0 ]; then
    ## run the command passed at the container creation
    $*
else
    ## run the UrT server
    echo "===== running UrT server ======"
    exec ./Quake3-UrT-Ded.x86_64 +set fs_homepath / +set dedicated 2 +set net_port 27960 +exec server.cfg
fi

