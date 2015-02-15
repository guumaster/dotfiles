#!/bin/bash
# Create a file .gitpass with permissions 600 containing this line: 
#   export GITHUB_PASSWORD="<your_github_password>"
#
# Then modify your ~/.gitconfig file similar to this: 
#
#   [github]
#     user = guumaster
#     password= !/path/to/env-git-pass.sh | tr -d '\n'
#

source ~/.gitpass
echo $GITHUB_PASSWORD
