# Supported versions
- 1.12 with tags: `1.12`, `latest`
- 1.11.2 with tags: `1.11.2`, `1.11`

# Description
- Docker hub page: https://hub.docker.com/r/t9t9t/minecraft-server/
- Source: https://github.com/t9t/minecraft-server-docker-image
- Report issues: https://github.com/t9t/minecraft-server-docker-image/issues

This image uses a volume to store the Minecraft world data, which also contains configuration files such as
`server.properties`, `banned-ips.json`, `banned-players.json`, `ops.json`, and `whitelist.json`.

# Start an instance
To start an instance, use something like the following:

```
docker run \
    --init --detach \
    --name=minecraft-server \
    --publish=25565:25565 \
    --restart=on-failure:5 \
    --stop-timeout=30 \
    --volume=/var/lib/minecraft/world/:/world \
    t9t9t/minecraft-server
```

This will use the directory `/var/lib/minecraft/world` as the world directory.

If it does not contain a valid `eula.txt` yet, the server will be shut down immediately. Make sure you agree to the
[EULA](https://account.mojang.com/documents/minecraft_eula), then add `eula=true` to `eula.txt`.

If it does not contain a `server.properties`, the server will create a default one. It is recommended that you tweak all
settings though.

You can configure the Java minimum and maximum memory usage using the environment variables `JAVA_MIN_MEMORY` and
`JAVA_MAX_MEMORY` environment variables respectively. The defaults are `128M` and `2048M` respectively.

# Sending commands

To send commands to the server, use the `sendcommand` script:

```
docker exec minecraft-server sendcommand 'say Teleporting skankhunt42 to (0,200,0)'
docker exec minecraft-server sendcommand teleport skankhunt42 0 200 0
```

Note that any output will be sent to the standard output of the Minecraft server, which will end up in the docker logs
and the Minecraft logs in `logs` directory.

Alternatively, you may enable RCON (by adding `enable-rcon=true` to `server.properties` and setting `rcon.password`
to some password), and use the `rcon` command:

```
docker exec minecraft-server sendcommand rconpassword 'say Teleporting skankhunt42 to (0,200,0)' 'teleport skankhunt42 0 200 0'
```

Quotes are mandatory in this case, because the `rcon` can accept multiple commands. This will return the output to the
standard output of `docker exec`.

This assumes that the RCON port is set to the default of `25575` (you may of course expose it using any other port by
using the `-p` option of `docker run`).
