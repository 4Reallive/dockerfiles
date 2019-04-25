FROM node:8-alpine

RUN apk add git && \
    git clone https://github.com/turtlecoin/.trtl-resolver && \
    cd .trtl-resolver && npm install && \
    apk del git
    
WORKDIR /.trtl-resolver

ENTRYPOINT node index.js
