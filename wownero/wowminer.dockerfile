FROM ubuntu:19.04

WORKDIR /opt
RUN 	apt update &&\
	apt install -y wget &&\
	wget https://github.com/wownero/wownero/releases/download/v0.6.1.1/wownero_linux_v0.6.1.1.tar.bz2 && \
	bunzip2 wownero_linux_v0.6.1.1.tar.bz2 && tar xvf wownero_linux_v0.6.1.1.tar 

WORKDIR /opt/wownero_linux_v0.6.1.1

CMD ./wownerod --start-mining Wo38JVX3mmY9rhGieAgNm22bTYLM5v5ovAjERZ29UYrQ1DNUbAq2qXMTUmJ2HMAqmZLcRhFQfHe7bFdbvipXatFv2GbsWnZZ5 --mining-threads $(nproc)
