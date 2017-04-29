#!/bin/sh

_stop_server() {
    echo Received SIGTERM, stopping
    echo stop > /minecraft_stdin
    wait ${JAVA_PID}
    exit
}

mkfifo /minecraft_stdin
trap "_stop_server" TERM

cd /world

java -Xms${JAVA_MIN_MEMORY} -Xmx${JAVA_MAX_MEMORY} -jar /mc/minecraft_server.jar nogui < /minecraft_stdin &
JAVA_PID=$!

# See: https://unix.stackexchange.com/questions/72962/getting-stdin-from-a-named-pipe
exec 3> /minecraft_stdin

# See: https://veithen.github.io/2014/11/16/sigterm-propagation.html
wait ${JAVA_PID}
trap - TERM INT
wait ${JAVA_PID}

exec 3>&-
