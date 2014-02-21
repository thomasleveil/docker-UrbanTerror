UrbanTerror server
==================

A docker image running the [UrbanTerror](http://urbanterror.info) game server.


Usage
-----

1. create a `/my_server/q3ut4` directory on your docker host machine
2. copy your UrT `server.cfg` config file in `/my_server/q3ut4`
4. run the docker container:

```bash
docker run -d -p 27960:27960/udp -v /my_server/q3ut4:/q3ut4 tomdesinto/urbanterror:4.2.018
```

### If you want to install additional maps

1. create a folder `/my_server/maps` on your docker host machine
2. copy the pk3 map files in it
4. run the docker container:

```bash
docker run -d -p 27960:27960/udp -v /my_server/q3ut4:/q3ut4 -v /my_server/maps:/maps tomdesinto/urbanterror:4.2.018
```

Security note
-------------

You can connect with SSH or SFTP to the docker container with user `root` on port 22 and using the following INSECURE private key                
   http://bit.ly/1hc36Ii [PyTTY format](http://bit.ly/NfDhxG)   
   
**DO NOT** expose port 22 on the Internet or anyone with that key will be able to connect as root to your container!                             


Build the docker image
----------------------

This image is based on tomdesinto/urbanterror-data which contains just the Urban Terror files (~2GB be patient).

```bash
git clone https://github.com/thomasleveil/docker-UrbanTerror.git
cd docker-UrbanTerror
sudo docker build -t tomdesinto/urbanterror:4.2.018 .
```

