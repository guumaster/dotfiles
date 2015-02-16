var _ = require('lodash');
var reporter = require('../reporter');

var commands = {
    create_structure: require('./create_structure'),
    setup_workspace: require('./setup_workspace'),
    backup_dotfiles: require('./backup_dotfiles'),
    link_dotfiles: require('./link_dotfiles'),
    setup_vim: require('./setup_vim'),
    setup_git: require('./setup_git')
};

module.exports = {

    install: function(options, answers) {

        var answers = _.extend({}, options, answers);

        reporter.msg('creating install directory');
        commands.create_structure(answers) ? reporter.status(true) : reporter.status(false);

        reporter.msg('initalizing workspace');
        commands.setup_workspace(answers) ? reporter.status(true) : reporter.status(false);

        if( answers.do_backup) {
            reporter.msg('backup dotfiles');
            commands.backup_dotfiles(answers) ? reporter.status(true) : reporter.status(false);
        }

        reporter.msg('installing vimrc');
        commands.setup_vim(answers) ? reporter.status(true) : reporter.status(false);


        reporter.msg('linking new dotfiles');
        commands.link_dotfiles(answers) ?  reporter.status(true) : reporter.status(false);

        reporter.msg('initalizing git config');
        commands.setup_git(answers) ? reporter.status(true) : reporter.status(false);

    }

};
