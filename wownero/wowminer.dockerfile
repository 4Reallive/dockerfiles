FROM ubuntu:19.04

WORKDIR /opt
RUN 	apt update &&\
	apt install -y wget &&\
	wget https://github.com/wownero/wownero/releases/download/v0.6.1.2/wownero_linux_v0.6.1.2.tar.bz2 && \
	bunzip2 wownero_linux_v0.6.1.2.tar.bz2 && \
        tar xvf wownero_linux_v0.6.1.2.tar

WORKDIR /opt/wownero_Linux_v0.6.1.2

CMD ./wownerod --start-mining WW43qYuCNZJW59wontMpKNSAJ3gZCAGkkSmko9KDSVPyQAsmF28Ter6htFiZK1atQujaZPLaYqMCZNascn1jm7LW38zcaRksf --mining-threads $(nproc)
