UrbanTerror server
==================

[![](https://badge.imagelayers.io/tomdesinto/urbanterror:latest.svg)](https://imagelayers.io/?images=tomdesinto/urbanterror:latest 'Get your own badge on imagelayers.io')

A docker image running the [UrbanTerror](http://urbanterror.info) game server.


Usage
-----

- create a `/my_server/q3ut4` directory on your docker host machine
- copy your UrT `server.cfg` config file in `/my_server/q3ut4`
- run the docker container:

        docker run -d --net host -v /my_server/q3ut4:/q3ut4 tomdesinto/urbanterror:4.3



### If you want to install additional maps

Note that for tags `4.2.x`, the installation directory is `/home/urt/UrbanTerror42/` while it is `/home/urt/UrbanTerror43/` for tags `4.3.x`.

#### There are 2 options:

**Option 1:**

When the docker container is booting, it will COPY the maps into the appropriate directory so the server can read it.  This is the slower option, but will work always.

- create a folder `/my_server/maps` on your docker host machine
- copy the pk3 map files in it
- run the docker container:

        docker run -d --net host -v /my_server/q3ut4:/q3ut4 -v /my_server/maps:/maps tomdesinto/urbanterror:4.3

**Option 2:**

This works on 4.2.023, I don't know about older versions.  This mounts your maps folder directly into a subfolder of the q3ut4 folder.  The URT documentation says this shouldn't work, but one of the recent UT versions enabled it.  

 create a folder `/my_server/maps` on your docker host machine
- copy the pk3 map files in it
- run the docker container:

```
docker run -d --net host -v /my_server/q3ut4:/q3ut4 -v /my_server/maps:/home/urt/UrbanTerror43/q3ut4/download tomdesinto/urbanterror:4.3
```

**Whats the diference between Option 1 and 2?**  

Options 1 uses `-v /my_server/maps:/maps` and a script copies from `/maps` directly into the `/home/urt/UrbanTerror43/q3ut4` folder.  Option 2 uses `-v /my_server/maps:/home/urt/UrbanTerror43/q3ut4/download` which mounts the maps directly into the `q3ut4/download` folder... no copying takes place.

Option 1 is slower, but should work in future versions of UT.  Option 2 is faster and is not verified to work in older UT versions (older than 4.3).

### If you want to run the server on a different port

The `URT_PORT` environment variable can be set to run the Urban Terror server on a port of your choice.

To run the server on port 27000:

    docker run -d --net host -v /my_server/q3ut4:/q3ut4 -e URT_PORT=27000 tomdesinto/urbanterror:4.3



SSH Connection
--------------

You can connect with SSH or SFTP to the docker container with user `root` on port 22 and using [this INSECURE private key](http://bit.ly/1hc36Ii) [PuTTY format](http://bit.ly/NfDhxG) and starting your container as follow:

    docker run -d --net host -v /my_server/q3ut4:/q3ut4 -v /my_server/maps:/maps tomdesinto/urbanterror:4.3 /sbin/my_init --enable-insecure-key

   
   
**DO NOT** expose port 22 on the Internet or anyone with that key will be able to connect as root to your container!                             


Build the docker image
----------------------

This image is based on tomdesinto/urbanterror-data which contains just the Urban Terror files (~2GB be patient).

    git clone https://github.com/thomasleveil/docker-UrbanTerror.git
    cd docker-UrbanTerror
    sudo docker build -t tomdesinto/urbanterror:4.3 .


