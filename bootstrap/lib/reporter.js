var chalk = require('chalk');
var out = process.stdout;

function report_msg(msg){
    out.write(chalk.blue('[ ] ' + msg));
    out.cursorTo(0);
}

function report_status(status) {
    var msg = status ?  chalk.bold('✔') :  chalk.red('✖');
    out.cursorTo(1);
    out.write(msg);
    out.write( "\n" );
}

function report_error(err, verbose){
    var msg = chalk.red(err.message);
    report_status(false);
    out.write(msg);
    out.write( "\n" );
    if( verbose ) {
        console.log(err.stack);
    }
}

module.exports = {
    msg: report_msg,
    status: report_status,
    error: report_error
};
