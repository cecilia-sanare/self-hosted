#!/bin/sh

set -e

if [ $UID -eq 0 ]; then
    echo "This script should *NOT* be run as sudo!"
    exit 1
fi

REPOS_DIR=$HOME/repos
SELF_HOSTED_DIR=$REPOS_DIR/self-hosted

mkdir -p $REPOS_DIR > /dev/null

if [ ! -d "$SELF_HOSTED_DIR" ]; then
    echo "Pulling down self-hosted..."
    git -C $REPOS_DIR clone git@github.com:cecilia-sanare/self-hosted.git > /dev/null
fi

if [ ! -e $SELF_HOSTED_DIR/data/traefik/acme.json ]; then
    touch $SELF_HOSTED_DIR/data/traefik/acme.json
fi

if [ ! -e $SELF_HOSTED_DIR/data/traefik/traefik.log ]; then
    touch $SELF_HOSTED_DIR/data/traefik/traefik.log
fi

if [ ! -e $SELF_HOSTED_DIR/data/traefik/traefik-access.log ]; then
    touch $SELF_HOSTED_DIR/data/traefik/traefik-access.log
fi

# Required by traefik
chmod 600 $SELF_HOSTED_DIR/data/traefik/acme.json

if [[ ! $(uname -v) =~ "NixOS" ]]; then
    echo "Running outside of NixOS, adjusting unpriviledged port restrictions..."
    sudo sysctl -w net.ipv4.ip_unprivileged_port_start=0
fi

# podman compose down -v
# podman compose up -d
