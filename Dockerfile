FROM ubuntu
RUN apt-get update
RUN apt-get -y install unzip

## if link is broken, check http://www.urbanterror.info/downloads/
ADD http://www.formulaworld.net/uploads/urt/UrbanTerror42_full018.zip /

RUN unzip UrbanTerror42_full018.zip && rm UrbanTerror42_full018.zip

ADD run.sh /
RUN chmod +x /run.sh

EXPOSE 27960
WORKDIR /UrbanTerror42
CMD ["/run.sh"]