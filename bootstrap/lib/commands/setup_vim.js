
require('shelljs/global');
var path = require('path');

module.exports = function setup_vim(options) {


    var vimrc_dir =  options.WORKSPACE + '/dotfiles/vimrc';
    var vim_backup = vimrc_dir + '/.backup';
    var vim_tmp =  vimrc_dir + '/.tmp';

    test('-e', vim_backup) || mkdir('-p', vim_backup);
    test('-e', vim_tmp)    || mkdir('-p', vim_tmp);

    rm('-rf', options.USER_HOME + '/.vim');

    ln('-s', vimrc_dir,  options.USER_HOME + '/.vim');
    ln('-s', vim_backup, options.USER_HOME + '/.vim/');
    ln('-s', vim_tmp, options.USER_HOME + '/.vim/');

    return true;
};


