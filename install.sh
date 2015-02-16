#!/bin/bash

INSTALL_FROM=${INSTALL_FROM:-github}
TMP_DIR=/tmp
SCRIPT_DIR=`dirname $0`
GITHUB_REPO=${GITHUB_REPO:-https://github.com/guumaster/dotfiles.git}

# check for git and node installed
hash git 2>/dev/null  || { echo >&2 "You need git to install these tools. Aborting."; exit 1; }
hash node 2>/dev/null || { echo >&2 "You need node to install these tools. Aborting."; exit 1; }

NODE_EXEC=`which node`
NPM_EXEC=`which npm`

# TODO: Move cloning to node script
# git clone tools

if [ $INSTALL_FROM = "github" ]
then
    [ -d $TMP_DIR/tools ] || rm $TMP_DIR/tools -r
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
