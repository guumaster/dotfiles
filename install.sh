#!/bin/bash

WORKSPACE_DIR="$HOME/workspace"
cd $HOME

# Backup any existing files
DOTFILES_TO_BACKUP="vimrc vim bash_config"
for dotfile in $DOTFILES_TO_BACKUP 
do
    [[ -f .$dotfile && ! -L .$dotfile ]] && mv .$dotfile $dotfile.orig
done

ln -s $WORKSPACE_DIR/bash/config $HOME/.bash_config
ln -s $WORKSPACE_DIR/config/dotfiles/vimrc $HOME/.vim
ln -s $HOME/.vim/vimrc $HOME/.vimrc

# Create new tmp and backup dirs for VIM
[[ ! -d .vim/.backup ]] && mkdir .vim/.backup
[[ ! -d .vim/.tmp ]] && mkdir .vim/.tmp

DOTFILES_DIR=$WORKSPACE_DIR/config/dotfiles
DOTFILES="bashrc gitconfig gitignore_global inputrc"

for file in $DOTFILES
do
    if [ -f .$file ]; then
         if [ -L .$file ]; then
             rm .$file
         else
             mv .$file $file.orig
         fi
     fi
     ln -s $DOTFILES_DIR/$file .$file
done

