## Build with 'docker build . -t xxxxxx'
## Replace xxxxxx with your imagename above and below
## Run with 'docker run -d -p x:80 --restart=unless-stopped --name=trtl-resolver xxxxxx'
## You can choose your port   ^ here.                                 imagename  ^ here
## TRTL power

FROM node:lts-alpine

RUN apk add --no-cache git && \
    git clone https://github.com/turtlecoin/.trtl-resolver && \
    cd .trtl-resolver && npm install && \
    apk del git
    
WORKDIR /.trtl-resolver

ENTRYPOINT node index.js
