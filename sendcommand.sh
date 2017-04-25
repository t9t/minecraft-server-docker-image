#!/bin/sh

if [ $# -lt 2 ]; then
  echo "Usage: sendcommand <password> <commands>"
  exit 1
fi

java -jar /mc/minecraft-rcon-client.jar 127.0.0.1:25575 "$@"
