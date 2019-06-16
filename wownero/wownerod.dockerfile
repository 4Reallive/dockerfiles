FROM ubuntu:19.04

EXPOSE 34568
EXPOSE 34567

WORKDIR /opt
RUN 	apt update &&\
	apt install -y wget &&\
	wget https://github.com/wownero/wownero/releases/download/v0.6.1.1/wownero_linux_v0.6.1.1.tar.bz2 && \
	bunzip2 wownero_linux_v0.6.1.1.tar.bz2 && tar xvf wownero_linux_v0.6.1.1.tar 

WORKDIR /opt/wownero_linux_v0.6.1.1

CMD ./wownerod --data-dir /root/.wownero --rpc-bind-ip 0.0.0.0 --confirm-external-bind
