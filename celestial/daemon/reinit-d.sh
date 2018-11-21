docker rm -f celestial-daemon
docker run -td -p 17236:17236 -p 18236:18236 -v /home/limited/.Celestial:/home/limited/.Celestial --restart=always --name celestial-daemon 4reallive/celestiald
