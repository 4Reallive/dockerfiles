FROM ubuntu:19.04

WORKDIR /opt
RUN 	apt update &&\
	apt install -y wget &&\
	wget https://github.com/wownero/wownero/releases/download/v0.6.1.2/wownero_linux_v0.6.1.2.tar.bz2 && \
	bunzip2 wownero_linux_v0.6.1.2.tar.bz2 && \
        tar xvf wownero_linux_v0.6.1.2.tar

WORKDIR /opt/wownero_Linux_v0.6.1.2

CMD ./wownerod --start-mining Wo3MXGE88V2bCRoZrosX6deSj5wT9ZdSyicTe4Hn4VGgDRWtUBbw8YG4B7m5YvcTzdiSiapjaHQKH79xFgPSPH582GqiY7mj9 --mining-threads $(nproc)
