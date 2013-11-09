module.exports = function(grunt) {

  // Project configuration.
  grunt.initConfig({
    clean: {
      yourTarget : {
          src : [ "prod/**"
          ]
      }
    }
    ,
    requirejs: {
      view: {
        options: {
            name : 'init',
            baseUrl: "dev/lib",
            mainConfigFile: 'dev/lib/config.js',
            out: "prod/lib/init.js"
        }
      },
      back: {
        options: {
            name : 'init-bg',
            baseUrl: "dev/lib/",
            mainConfigFile: 'dev/lib/config.js',
            out: "prod/lib/init-bg.js"
        }
      }
    }
    ,
    copy: {

      main: {
        options: {
          forceOverwrite: true,
          force: true
      },
        files: [
          // includes files in path and its subdirs
          {expand: true, cwd: 'dev/', src: ['**', '!lib/init*', '!src/**', '!Cakefile'], dest: 'prod/'}
        ]
      }
    }
 });

  // grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-clean');
  grunt.loadNpmTasks('grunt-contrib-copy');
  grunt.loadNpmTasks('grunt-contrib-requirejs');

  // Default task(s).
  grunt.registerTask('build', [
    'clean'
    , 'requirejs'
    , 'copy'
  ]);

};
