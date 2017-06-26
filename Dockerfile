FROM openjdk:jre-alpine

ARG minecraft_version=1.12
ARG rcon_client_version=1.0.0

ENV JAVA_MIN_MEMORY=128M
ENV JAVA_MAX_MEMORY=2048M

RUN mkdir /mc

ADD https://s3.amazonaws.com/Minecraft.Download/versions/${minecraft_version}/minecraft_server.${minecraft_version}.jar /mc/minecraft_server.jar
ADD "https://search.maven.org/remotecontent?filepath=com/github/t9t/minecraft-rcon-client/minecraft-rcon-client/${rcon_client_version}/minecraft-rcon-client-${rcon_client_version}.jar" /mc/minecraft-rcon-client.jar

ADD rcon.sh sendcommand.sh start.sh /mc/

RUN ln -s /mc/sendcommand.sh /usr/local/bin/sendcommand
RUN ln -s /mc/rcon.sh /usr/local/bin/rcon

WORKDIR /world
VOLUME /world
EXPOSE 25565 25575

CMD ["/mc/start.sh"]
