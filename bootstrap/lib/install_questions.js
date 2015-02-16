var home = require('./home');
var questions = [
    {
        type: 'input',
        name: 'WORKSPACE',
        message: 'Workspace path:',
        default: '/tmp' + home() + '/workspace'
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
        name: 'BACKUP_DIR',
        message: 'Backup path:',
        default: '/tmp' + home() + '/dotfiles_backup'
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
