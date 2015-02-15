var home = require('./home');
var questions = [
    {
        type: 'input',
        name: 'workspace_path',
        message: 'Workspace path:',
        default: home() + '/workspace'
    },
    {
        type: 'confirm',
        name: 'do_backup',
        message: 'Backup dotfiles?',
        default: false
    },
    {
        when: function(answers) { return answers.do_backup; },
        type: 'input',
        name: 'backup_path',
        message: 'Backup path:',
        default: home() + '/dotfiles_backup'
    },
    {
        type: 'input',
        name: 'GIT_AUTHOR_NAME',
        message: 'Git Author name:',
        default: 'Anonymous'
    },
    {
        type: 'input',
        name: 'GIT_AUTHOR_EMAIL',
        message: 'Git Author email:',
        default: 'nobody@home'
    }

];

module.exports = questions;
