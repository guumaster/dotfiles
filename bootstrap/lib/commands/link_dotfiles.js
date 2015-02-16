require('shelljs/global');

var _ = require('lodash');
var path = require('path');

module.exports = function(options) {

    var dotfiles_dir = path.join(options.WORKSPACE,'dotfiles');

    _.filter(options.DOTFILES, function (f) {
        return test('-e', path.resolve(options.USER_HOME, f));
    })
        .forEach(function (f) {

            var newfile = path.join(dotfiles_dir, path.basename(f).replace('.', ''));
            var link =  path.join(options.USER_HOME, path.basename(f));
            var original = path.join(options.USER_HOME, f);

            console.log('move %s, link from %s to %s', original, link, newfile);

            if( !test('-e', newfile) ) {
                return;
            }

            mv('-f', original, options.TMP_DIR);
            ln('-s', newfile, link);

        });





    return true;

};
