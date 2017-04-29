#!/bin/sh

if [ $# -lt 2 ]; then
  echo "Usage: rcon <password> <commands>"
  exit 1
fi

java -jar /mc/minecraft-rcon-client.jar 127.0.0.1:25575 "$@"
