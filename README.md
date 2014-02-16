UrbanTerror server
==================

A docker image running the [UrbanTerror](http://urbanterror.info) game server.


Usage
-----

1. create a `/my_server/q3ut4` directory on your docker host machine
2. copy the UrT `server.cfg` config file in `/my_server/q3ut4`
4. run the docker container:

```bash
docker run -d -p 27960:27960 -v /my_server/q3ut4:/q3ut4 tomdesinto/urt
```

### If you want to install additional maps

1. create a folder `/my_server/maps` on your docker host machine
2. copy the pk3 map files in it
4. run the docker container:

```bash
docker run -d -p 27960:27960 -v /my_server/q3ut4:/q3ut4 -v /my_server/maps:/maps tomdesinto/urt
```



Build the docker image
----------------------

The build process will download the full UrbanTerror archive which is over 1GB. Be patient.

```bash
git clone https://github.com/thomasleveil/dockerfiles.git
cd dockerfiles/UrbanTerror
sudo docker build -t urt .
```

