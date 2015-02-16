require('shelljs/global');

var _ = require('lodash');

module.exports = function(options) {

    if( test('-d', options.BACKUP_DIR )) {
        throw new Error('Backup path ' + options.BACKUP_DIR  + ' already exists');
    }

    mkdir('-p', options.BACKUP_DIR );

    cp('-rf', options.DOTFILES, options.BACKUP_DIR );

    return true;
};
