require('shelljs/global');

module.exports = function(options) {

    if (test('-e', options.WORKSPACE) ) {
        throw new Error( options.WORKSPACE  + ' is not empty');
    }

    mkdir('-p', options.WORKSPACE);
    console.log(  options.SRC_DIR + '/bash' );

    cp('-r', options.SRC_DIR + '/bash', options.WORKSPACE);
    cp('-r', options.SRC_DIR + '/dotfiles', options.WORKSPACE);

    return true;
};
