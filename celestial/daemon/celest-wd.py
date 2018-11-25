#!/usr/bin/python3
# PRE REQ - pip3 install turtlecoin
import subprocess
import logging
from turtlecoin import TurtleCoind
rpc_host = 'localhost'
rpc_port = 18236
turtlecoind = TurtleCoind(rpc_host, rpc_port)
response = turtlecoind.get_info()

if response['synced'] == False:
    #use subprocess to restart container
    subprocess.call(["docker", "restart", "celestial-daemon"])
    logging.warn("Restarted Celesital node")
else:    
    subprocess.call(["docker", "ps"])
    logging.warn("Test Warning, nothing restarted")

