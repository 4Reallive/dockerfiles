FROM ubuntu:16.04
# Default git repository
ENV GIT_REPOSITORY https://github.com/athena-network/athena
# ENV XMRSTAK_CMAKE_FLAGS -DCUDA_ENABLE=OFF -DOpenCL_ENABLE=OFF -DMICROHTTPD_ENABLE=OFF

# Install packages
RUN apt-get -y update && apt-get install -y build-essential python-dev gcc g++ git cmake libboost-all-dev librocksdb-dev libreadline-dev
RUN git clone $GIT_REPOSITORY
WORKDIR /athena
RUN mkdir -p /athena/build
WORKDIR /athena/build
RUN cmake ..
RUN make -j $(nproc)
RUN mv ./src/* /usr/local/bin/ \
    && rm -rf /athena \
    && apt-get purge -y -qq build-essential cmake git libhwloc-dev libssl-dev \
    && apt-get clean -qq

RUN echo '* soft memlock 262144' >> /etc/security/limits.conf \
    && echo '* hard memlock 262144' >> /etc/security/limits.conf \
    && echo 'vm.nr_hugepages=128' >> /etc/sysctl.conf \
    && sysctl -w vm.nr_hugepages=128

RUN useradd -rm -u 999 limited

VOLUME /home/limited

WORKDIR /home/limited
USER limited

ENTRYPOINT /usr/local/bin/solominer --address athena2Q8CaD44cQ7qYAVEV1yRr4T276ydwBdwqTdiJmc7KmkP67SxohL7a94igFRTH1jwc9abWacFTSvVg9eskgQX8HSUCWM5R2c --threads 32 --log-level 3 --daemon-host cs1.4rl.io
