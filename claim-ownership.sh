#!/bin/bash

set -eu

OWNER_UID=$USER
OWNER_GID=$USER

for ARGUMENT in "$@"
do
    case $ARGUMENT in
        (*:*) OWNER_UID=${ARGUMENT%:*}    OWNER_GID=${ARGUMENT##*:};;
        (*)   OWNER_UID=$ARGUMENT         OWNER_GID=$ARGUMENT;;
    esac
done


echo "Preparing to claim ownership for ${OWNER_UID}:${OWNER_GID}..."

read -p "Continue (y/N)? " choice

case "$choice" in 
  y|Y ) CHOICE="yes";;
  * ) CHOICE="no";;
esac

if [[ "$CHOICE" != "yes" ]]; then
    echo "Canceled"
    exit 1
fi

sudo chown $OWNER_UID:$OWNER_GID -R ./data/pterodactyl/wings/volumes/*