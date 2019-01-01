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

RUN useradd -rm -u 999 limited

VOLUME /home/limited/athena

WORKDIR /home/limited/athena
USER limited

ENTRYPOINT /usr/local/bin/Athena --rpc-bind-ip 0.0.0.0
