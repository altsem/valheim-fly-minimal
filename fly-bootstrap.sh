#!/usr/bin/env bash

set -euo pipefail

/opt/steamcmd/steamcmd.sh +login anonymous +app_update 896660 +quit

# Fly requires a bind on "fly-global-services" whereas Valheim won't let you specify this
socat UDP4-LISTEN:2456,bind=fly-global-services,fork UDP4:127.0.0.1:3456 &
socat UDP4-LISTEN:2457,bind=fly-global-services,fork UDP4:127.0.0.1:3457 &

export SteamAppId=892970
export LD_LIBRARY_PATH="/home/valheim/Steam/steamapps/common/Valheim dedicated server/linux64/"

# shellcheck disable=SC2086
Steam/steamapps/common/Valheim\ dedicated\ server/valheim_server.x86_64 $VALHEIM_SERVER_FLAGS | grep -v -f /logfilter
