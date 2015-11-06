#!/bin/bash
# This script will create the folder "scripts" in the home of the user and will
# add it to the PATH environment variable.

SCRIPTSDIR="$HOME/scripts"

if [ ! -d $SCRIPTSDIR ]; then
    mkdir $SCRIPTSDIR
fi

if [ ! `echo $PATH | grep $SCRIPTSDIR` ]; then
    PATH="${SCRIPTSDIR}:$PATH"
    export PATH
fi
