require('shelljs/global');

var _ = require('lodash');

module.exports = function(options) {

    if( test('-d', options.backup_path )) {
        throw new Error('Backup path already exists');
    }

    mkdir('-p', options.backup_path );

    cp('-rf', options.DOTFILES, options.backup_path );
    //
    //_.each(dotfiles, function(file) {
    //
    //    file = options.USER_HOME + '/.' + file;
    //    if( test('-e', file) ) {
    //        cp('-r', file, options.backup_path );
    //    }
    //});

    return true;
};

/*


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

*/
