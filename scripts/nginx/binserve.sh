docker run --name binserve -p 888:80 -v /opt/docker/nginx/pubbin:/usr/share/nginx/html:ro -d nginx:alpine
