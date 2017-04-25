# Supported versions
- 1.11.2 with tags: `1.11.2`, `1.11`, `latest`

# Description
- Docker hub page: https://hub.docker.com/r/t9t9t/minecraft-server/
- Source: https://github.com/t9t/minecraft-server-docker-image
- Report issues: https://github.com/t9t/minecraft-server-docker-image/issues

This image uses a volume to store the Minecraft world data, which also contains configuration files such as `server.properties`, `banned-ips.json`, `banned-players.json`, `ops.json`, and `whitelist.json`.

# Start an instance
To start an instance, use something like the following:

```
docker run -d --name minecraft-server -v /var/lib/minecraft/world/:/world -p 25565:25565 t9t9t/minecraft-server
```


This will use the directory `/var/lib/minecraft/world` as the world directory.

If it does not contain a valid `eula.txt` yet, the server will be shut down immediately. Make sure you agree to the [EULA](https://account.mojang.com/documents/minecraft_eula), then add `eula=true` to `eula.txt`.

If it does not contain a `server.properties`, the server will create a default one. It is recommended that you tweak all settings though.

# Sending commands

To send commands to the server, first ensure that the RCON console is enabled (by adding `enable-rcon=true` to `server.properties` and setting `rcon.password` to some password). Then use the following command:

```
docker exec minecraft-server sendcommand rconpassword 'say Teleporting skankhunt42 to (0,200,0)' 'teleport skankhunt42 0 200 0'
```

This assumes that the RCON port is set to the default of `25575` (you may of course expose it using any other port by using the `-p` option of `docker run`).
