require('shelljs/global');

var _ = require('lodash');


module.exports = function(options) {

    var files = _.filter(options.DOTFILES, function(f){ return  test('-e', options.USER_HOME + '/.' + f); }).map(function(f){ return options.USER_HOME + '/.'  + f; });

    test('-d', options.TMP_DIR) || mkdir('-p',  options.TMP_DIR);

    mv('-f', files, options.TMP_DIR);

    return true;

};
