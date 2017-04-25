# Minecraft Server Docker Image

## In short
Create a directory for the world data, add a [`server.properties`](http://minecraft.gamepedia.com/Server.properties) and `eula.txt` (containing `eula=true`, assuming you agree with the [EULA](https://account.mojang.com/documents/minecraft_eula)). Then start as follows:

```
docker run -d --name minecraft-server -v /var/lib/minecraft/world/:/world -p 25565:25565 t9t9t/minecraft-server
```

To execute one or more commands, ensure that RCON is enabled (using port `25575`) and use `docker exec`:

```
docker exec minecraft-server sendcommand rconpassword 'say Teleporting skankhunt42 to (0,200,0)' 'teleport skankhunt42 0 200 0'
```

For more information and options, see: https://hub.docker.com/r/t9t9t/minecraft-server/

