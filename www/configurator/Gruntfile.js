var grunt = require('grunt');

grunt.initConfig({

    watch: {

        php: {
            files: ['src/**/*php', 'src/**/*js', 'src/**/*html'],
            tasks: ['default'],
            options: {
                nospawn: true, //Without this option specified express won't be reloaded
                livereload: true
            }

        }
    }


});

grunt.loadNpmTasks('grunt-contrib-watch');

grunt.registerTask('default', ['watch']);


