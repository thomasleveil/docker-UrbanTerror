#!/bin/sh

cat <<"EOF"

         _   _      _                   _____
        | | | |_ __| |__   __ _ _ __   |_   _|__ _ __ _ __ ___  _ __
        | | | | '__| '_ \ / _` | '_ \    | |/ _ \ '__| '__/ _ \| '__|
        | |_| | |  | |_) | (_| | | | |   | |  __/ |  | | | (_) | |
         \___/|_|  |_.__/ \__,_|_| |_|   |_|\___|_|  |_|  \___/|_|

 +---------------------------------------------------------------------------+
 |                                                                           |
 |  Start the docker container with a volume mounted to /q3ut4.              |
 |    $ docker run -d -p 27960:27960 -v /change/me/q3ut4:/q3ut4 figurt/urt   |
 |  This volume MUST contain your server.cfg file.                           |
 |                                                                           |
 |                                                                           |
 |  If you want additional maps, also mount a volume containing the your pk3 |
 |  map files to /maps.                                                      |
 |    $ docker run -d -p 27960:27960 -v /change/me/q3ut4:/q3ut4 \            |
 |      -v /change/me/my_maps:/maps figurt/urt                               |
 |                                                                           |
 |  You can connect with SSH or SFTP to the docker container with user root  |
 |  on port 22 and using the following INSECURE private key                  |
 |    http://bit.ly/1hc36Ii                                                  |
 |  DO NOT expose port 22 on the Internet or anyone with that key will be    |
 |  able to connect as root to your container!                               |
 |                                                                           |
 +---------------------------------------------------------------------------+


EOF
