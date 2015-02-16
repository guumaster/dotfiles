
require('shelljs/global');
var path = require('path');
var fs = require('fs');
var swig = require('swig');

var tpl = path.resolve(__dirname, '../../templates/git_extra_config');

var template = swig.compileFile(tpl);

module.exports = function setup_git(options) {

    var config_file = path.join(options.USER_HOME, '.gitconfig');

    var GIT_SET_USER='git config -f {GIT_CONFIG_FILE} user.name "{GIT_AUTHOR_NAME}"'
        .replace('{GIT_CONFIG_FILE}', config_file)
        .replace('{GIT_AUTHOR_NAME}', options.GIT_AUTHOR_NAME);

    var GIT_SET_EMAIL='git config -f {GIT_CONFIG_FILE} user.email "{GIT_AUTHOR_EMAIL}"'
        .replace('{GIT_CONFIG_FILE}', config_file)
        .replace('{GIT_AUTHOR_EMAIL}', options.GIT_AUTHOR_EMAIL);


    if (exec(GIT_SET_USER).code !== 0 || exec(GIT_SET_EMAIL).code !== 0) {
        return false;
    }

    fs.writeFileSync( options.WORKSPACE + '/bash/config/exports.d/git_config.sh',  template(options) );

    return true;
};
