
require('shelljs/global');
var path = require('path');
var fs = require('fs');
var swig = require('swig');

var tpl = path.resolve(__dirname, '../../templates/workspace.sh');

var template = swig.compileFile(tpl);

module.exports = function setup_workspace(options) {

    fs.writeFileSync( options.INSTALL_DIR + '/../bash/config/path.d/workspace.sh',  template(options) );

    return true;
};
