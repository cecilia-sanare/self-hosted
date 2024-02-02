#!/bin/bash

export ALTSERVER_ANISETTE_SERVER="http://127.0.0.1:6969"

ALTSERVER_VERSION=v0.0.5
ALTSERVER_FILE=./AltServer-$ALTSERVER_VERSION

if [ ! -f $ALTSERVER_FILE ]; then
    curl -L "https://github.com/NyaMisty/AltServer-Linux/releases/download/$ALTSERVER_VERSION/AltServer-x86_64" > $ALTSERVER_FILE
    chmod u+x $ALTSERVER_FILE
fi

$ALTSERVER_FILE