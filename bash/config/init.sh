#!/bin/sh

TOOLS_DIR=$WORKSPACE/tools/bash/config

source $TOOLS_DIR/bash_options.sh
source $TOOLS_DIR/functions.sh

source_dir $TOOLS_DIR/path.d
source_dir $TOOLS_DIR/exports.d
source_dir $TOOLS_DIR/aliases.d
source_dir $TOOLS_DIR/completion.d
