#!/bin/sh

URT_PORT=${URT_PORT:-27960}

## change ownership for /q3ut4
chown urt: /q3ut4

## run the UrT server
echo "===== running UrT server on port ${URT_PORT} ======"
exec /sbin/setuser urt /home/urt/UrbanTerror42/Quake3-UrT-Ded.x86_64 \
	+set fs_game q3ut4 \
	+set fs_homepath / \
	+set dedicated 2 \
	+set net_port ${URT_PORT} \
	+exec server.cfg \
	+set com_hunkmegs 128 \
	2>&1
