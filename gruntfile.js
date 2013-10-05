module.exports = function(grunt) {

  // Project configuration.
  grunt.initConfig({
    uglify: {
       my_target: {
         files: {
           //'prod/text-emoticon/js/min/core.min.js': ['text-emoticon/js/core/*.js']
         }
       }
     },
    copy: {

      main: {
         options: {
        forceOverwrite: true,
        force: true
    },
        files: [
          //{expand: true, src: ['text-emoticon/**', '!text-emoticon/js/core/**'], dest: 'prod/'} // includes files in path and its subdirs
        ]
      }
    }
 });

  // Load the plugin that provides the "uglify" task.
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-copy');

  // Default task(s).
  grunt.registerTask('default', ['uglify', 'copy']);

};
