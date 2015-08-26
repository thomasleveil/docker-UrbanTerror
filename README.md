UrbanTerror server
==================

[![](https://badge.imagelayers.io/tomdesinto/urbanterror:latest.svg)](https://imagelayers.io/?images=tomdesinto/urbanterror:latest 'Get your own badge on imagelayers.io')

A docker image running the [UrbanTerror](http://urbanterror.info) game server.


Usage
-----

- create a `/my_server/q3ut4` directory on your docker host machine
- copy your UrT `server.cfg` config file in `/my_server/q3ut4`
- run the docker container:

        docker run -d --net host -v /my_server/q3ut4:/q3ut4 tomdesinto/urbanterror:4.2.023


### If you want to install additional maps

- create a folder `/my_server/maps` on your docker host machine
- copy the pk3 map files in it
- run the docker container:

        docker run -d --net host -v /my_server/q3ut4:/q3ut4 -v /my_server/maps:/maps tomdesinto/urbanterror:4.2.023


### If you want to run the server on a different port

The `URT_PORT` environment variable can be set to run the Urban Terror server on a port of your choice.

To run the server on port 27000:

    docker run -d --net host -v /my_server/q3ut4:/q3ut4 -e URT_PORT=27000 tomdesinto/urbanterror:4.2.023



SSH Connection
--------------

You can connect with SSH or SFTP to the docker container with user `root` on port 22 and using [this INSECURE private key](http://bit.ly/1hc36Ii) [PuTTY format](http://bit.ly/NfDhxG) and starting your container as follow:

    docker run -d --net host -v /my_server/q3ut4:/q3ut4 -v /my_server/maps:/maps tomdesinto/urbanterror:4.2.023 /sbin/my_init --enable-insecure-key

   
   
**DO NOT** expose port 22 on the Internet or anyone with that key will be able to connect as root to your container!                             


Build the docker image
----------------------

This image is based on tomdesinto/urbanterror-data which contains just the Urban Terror files (~2GB be patient).

    git clone https://github.com/thomasleveil/docker-UrbanTerror.git
    cd docker-UrbanTerror
    sudo docker build -t tomdesinto/urbanterror:4.2.023 .


