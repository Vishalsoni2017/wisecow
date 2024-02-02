# use a base image ubuntu
FROM ubuntu:20.04

# update and install required packe
RUN apt-get update -y
RUN apt-get install fortune-mod cowsay -y && apt install netcat-openbsd -y

# set FORTUNE path and add it to path 
ENV FORTUNE /usr/games
ENV PATH $FORTUNE:$PATH

# COPY code to docker container
COPY . /opt/accuknow

# Expose port 4499
EXPOSE 4499

# specify default command
CMD [ "/bin/bash","-c","sh /opt/accuknow/wisecow.sh" ]
