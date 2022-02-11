FROM cm2network/steamcmd:steam

LABEL name="Docker-ProjectCars-DS"
LABEL version=1.0.0
LABEL maintainer="InfiniteFlame"

# Set env variables
ENV STEAMAPPID=332670
ENV STEAMAPPDIR=/home/steam/pcars_ds

# Expose a volume so that PCars server data is persistent
VOLUME ${STEAMAPPDIR}

# Add server config script
COPY server.cfg /home/steam/server.cfg
COPY start.sh /home/steam/start.sh

# Steam port
EXPOSE 8766/tcp \
    8766/udp \
    # Host port
    27015/tcp \
    27015/udp \
    # Query port
    27016/tcp \
    27016/udp \
    # HTTP API port
    9000/tcp

# Switch to dedicated steam user for first time setup and entrypoint execuution
USER steam

RUN "${STEAMCMDDIR}"/steamcmd.sh \
    +login anonymous \
    +force_install_dir "${STEAMAPPDIR}" \
    +app_update "${STEAMAPPID}" validate \
    +exit


ENTRYPOINT [ "/home/steam/start.sh" ]