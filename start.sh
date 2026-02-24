#!/bin/bash
# -----------------------------------------------------------------------------
# Project Cars /start.sh script
# -----------------------------------------------------------------------------

if [ ! -f ${STEAMAPPDIR}/server.cfg ]
then
    cp /home/steam/server.cfg ${STEAMAPPDIR}/server.cfg
fi

${STEAMCMDDIR}/steamcmd.sh \
    +login anonymous \
    +force_install_dir ${STEAMAPPDIR} \
    +app_update ${STEAMAPPID} validate \
    +exit \
    && ${STEAMAPPDIR}/DedicatedServerCmd --config ${STEAMAPPDIR}/server.cfg