FROM ubuntu
RUN apt-get update 
RUN apt-get -y install imagemagick
COPY ./skript.sh /home/skript.sh
COPY ./smi.png /home/smi.png
RUN chmod + /home/skript.sh && sed -i -e 's/\r$//' /home/skript.sh
MAINTAINER Marina Sayapina <7361smi@gmail.com>
