#!/bin/sh

if [ $# -lt 1 ]; then
  echo "Usage: sendcommand <command>"
  exit 1
fi

echo $* > /minecraft_stdin
