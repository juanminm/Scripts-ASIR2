#!/bin/sh

## You must add this part at the end of your ~/.bashrc file to create a directory called "scripts"
## and add it to the PATH environment variable.

if [ ! -d $HOME/scripts ]; then
    mkdir $HOME/scripts
fi

DIRSCRIPT=`echo $(cd $HOME/scripts && pwd -P)`
echo $PATH | grep -q $DIRSCRIPT
if [ $? = 1 ]
then
    PATH ="${DIRSCRIPT}:$PATH"
    export $PATH
fi
