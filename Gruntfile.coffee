module.exports = (grunt) ->

  grunt.initConfig
    pkg: grunt.file.readJSON("package.json")

    compass:
      build:
        options:
          config: 'config.rb'
          trace: true

    autoprefixer:
      build:
        options:
          browsers: ['last 2 versions']
        files:
          'dist/css/prettyPhoto.css': ['dist/css/prettyPhoto.css']

    cssmin:
      minify:
        expand: true
        cwd: 'dist/css/'
        src: ['*.css', '!*.min.css']
        dest: 'dist/css/'
        ext: '.min.css'
        
    uglify:
      options:
        compress: true
      minify:
        options:
          compress: true
        files:
          'dist/js/jquery.prettyPhoto.min.js': ['js/jquery.prettyPhoto.js']

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-contrib-compass'
  grunt.loadNpmTasks 'grunt-autoprefixer'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  
  grunt.registerTask 'default',           ['build']
  grunt.registerTask 'build',             ['compass', 'autoprefixer', 'cssmin', 'uglify']
