#!/bin/bash
synced=$(curl -s http://127.0.0.1:18236/getinfo | cut -d , -f 15| cut -d: -f2)
if curl -s http://127.0.0.1:18236/getinfo | cut -d , -f 15| cut -d: -f2 | grep false
then
	docker restart celestial-daemon
fi

