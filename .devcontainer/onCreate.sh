#!/bin/sh

set -e

WORKSPACE="$1"
cd /tmp

if [ ! -d "$WORKSPACE/tools/mwccarm" ]; then
    wget https://github.com/pret/pmd-sky/raw/workflows/assets/mwccarm.zip
    unzip mwccarm.zip
    mv -v mwccarm "$WORKSPACE/tools"
fi

if [ ! -d "$WORKSPACE/tools/bin" \
     -o ! -f "$WORKSPACE/sub/ARM7-TS.lcf.template" \
     -o ! -f "$WORKSPACE/ARM9-TS.lcf.template" \
     -o ! -f "$WORKSPACE/mwldarm.response.template" ]; then
    wget https://github.com/pret/pmd-sky/raw/workflows/assets/NitroSDK-4_2-071210-jp.7z
    7z x NitroSDK-3_2-060901.7z
    rm -rf "$WORKSPACE/tools/bin"
    mv -v NitroSDK-3_2-060901/tools/bin "$WORKSPACE/tools"
    mv -v NitroSDK-3_2-060901/include/nitro/specfiles/ARM7-TS.lcf.template "$WORKSPACE/sub/"
    mv -v NitroSDK-3_2-060901/include/nitro/specfiles/ARM9-TS.lcf.template "$WORKSPACE/"
    mv -v NitroSDK-3_2-060901/include/nitro/specfiles/mwldarm.response.template "$WORKSPACE/"
fi

# Set up wine under a virtual X11 server to hide the annoying GUI popup.
# Setting this up here means wine won't need to do setup on first build.
# Note that this doesn't work if done in the Dockerfile directly, it
# needs to be done in the running devcontainer.
xvfb-run wineboot
