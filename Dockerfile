FROM tomdesinto/urbanterror-data:4.3.0-2
# See https://registry.hub.docker.com/u/tomdesinto/urbanterror-data/tags/manage/
# a list of version numbers.

# Set correct environment variables.
ENV HOME /root

# Activate the SSH service
RUN rm -f /etc/service/sshd/down

# Regenerate SSH host keys. baseimage-docker does not contain any, so you
# have to do that yourself. You may also comment out this instruction; the
# init system will auto-generate one during boot.
RUN /etc/my_init.d/00_regen_ssh_host_keys.sh


## Install an SSH of your choice.
# ADD your_key /tmp/your_key
# RUN cat /tmp/your_key >> /root/.ssh/authorized_keys && rm -f /tmp/your_key
## -OR-
## Uncomment this to enable the insecure key.
# RUN /usr/sbin/enable_insecure_key

## Install startup scripts
ADD 01-motd.sh /etc/my_init.d/01-motd.sh
ADD 02-check_requirements.sh /etc/my_init.d/02-check_requirements.sh
ADD 03-install_maps.sh /etc/my_init.d/03-install_maps.sh
RUN chmod +x /etc/my_init.d/*.sh

## Install UrT service
RUN mkdir /etc/service/urt
ADD urt.sh /etc/service/urt/run
RUN chmod u+x /etc/service/urt/run


## Install packages to allow to run the Urban Terror 32bit binary
RUN apt update \
  && apt install -y \
    lib32gcc1 \
    lib32ncurses5 \
    lib32stdc++6 \
    lib32z1 \
    libc6 \
    libc6-i386

WORKDIR /home/urt/UrbanTerror43
ENV URT_PORT 27960

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]
