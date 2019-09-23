FROM ubuntu:18.04 as builder

# DEPENDENCIES
RUN apt-get update && \
    apt-get install -y autoconf cmake make automake libtool git libboost-all-dev libssl-dev g++ libcurl4-openssl-dev

# MAKE BINARIES
RUN git clone https://github.com/bitshares/bitshares-core.git && \
    cd bitshares-core && \
    git checkout master && \
    git submodule update --init --recursive && \
    cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo . && \
    make -j 4

# COPY FILES
RUN mkdir -p /tmp/build && \
    find /bitshares-core/programs/delayed_node -type f -perm /a+x -exec cp {} /tmp/build \;
RUN strip /tmp/build/delayed_node

FROM ubuntu:18.04

# Create limited user and switch
RUN groupadd -r -g 998 limited && useradd -r -m -u 999 limited -g limited && \
    apt-get update && \
    apt-get -y install libboost-all-dev libssl-dev g++ libcurl4-openssl-dev && \
    apt-get auto-clean
COPY --from=builder /tmp/build/* /usr/local/bin/
USER limited
WORKDIR /home/limited/.bitshares/
CMD delayed_node
