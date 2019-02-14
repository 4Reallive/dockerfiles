docker run -d -v /opt/docker/athenanode/athena-node:/usr/share/nginx/html:ro -p 80:80 -p 443:443 --name athxnode.io --restart always nginx:alpine
