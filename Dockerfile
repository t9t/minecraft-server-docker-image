FROM openjdk:jre-alpine

ARG minecraft_version=1.11.2
ARG rcon_client_version=1.0.0

ENV JAVA_MIN_MEMORY=128M
ENV JAVA_MAX_MEMORY=2048M

RUN mkdir /mc

ADD https://s3.amazonaws.com/Minecraft.Download/versions/${minecraft_version}/minecraft_server.${minecraft_version}.jar /mc/minecraft_server.jar
ADD "https://search.maven.org/remotecontent?filepath=com/github/t9t/minecraft-rcon-client/minecraft-rcon-client/${rcon_client_version}/minecraft-rcon-client-${rcon_client_version}.jar" /mc/minecraft-rcon-client.jar
ADD sendcommand.sh /mc/sendcommand.sh
RUN ln -s /mc/sendcommand.sh /usr/local/bin/sendcommand

WORKDIR /world

EXPOSE 25565

CMD java -Xms${JAVA_MIN_MEMORY} -Xmx${JAVA_MAX_MEMORY} -jar /mc/minecraft_server.jar nogui
VOLUME /world
