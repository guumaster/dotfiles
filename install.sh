#!/bin/bash

TOOLS_SRC_PATH=${TOOLS_SRC_PATH:-local}
TMP_DIR=/tmp
SCRIPT_DIR=`dirname $0`
GITHUB_REPO=${GITHUB_REPO:-https://github.com/guumaster/vimrc}

# check git and node
hash git 2>/dev/null  || { echo >&2 "You need git to install these tools. Aborting."; exit 1; }
hash node 2>/dev/null || { echo >&2 "You need node to install these tools. Aborting."; exit 1; }

NODE_EXEC=`which node`
NPM_EXEC=`which npm`

# git clone tools

if [ $TOOLS_SRC_PATH = "github" ]
then
    git clone $GITHUB_REPO $TMP_DIR/tools
else
    [ -d $TMP_DIR/tools ] || mkdir $TMP_DIR/tools
    cp $SCRIPT_DIR/* $TMP_DIR/tools/ -r
fi

cd $TMP_DIR/tools/

# npm install
$NPM_EXEC install

# ask paths and vars
$NODE_EXEC bootstrap/install
