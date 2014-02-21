#!/bin/sh

## run the UrT server
echo "===== running UrT server ======"
exec /sbin/setuser urt /home/urt/UrbanTerror42/Quake3-UrT-Ded.x86_64 +set fs_homepath / +set dedicated 2 +set net_port 27960 +exec server.cfg 2>&1

