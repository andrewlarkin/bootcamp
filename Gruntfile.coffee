# global module: false
module.exports = (grunt) ->

  # Modules
  grunt.loadNpmTasks 'grunt-init'
  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  # Grunt Tasks
  grunt.initConfig
    meta: version: '0.0.3'

    # Sass
    sass: test:
      options:
        style: 'expanded'
        loadPath: './dist'
      files: './test/results.css': './test/specs.scss'

    # Bootcamp
    bootcamp: dist:
      files: src: ['./test/results.css']

    # Watch
    watch: dist:
      files: ['./dist/**/*.scss', './test/**/*.scss']
      tasks: ['sass', 'bootcamp']

  grunt.loadTasks 'tasks'

  # Tasks
  grunt.registerTask 'default', ['sass', 'bootcamp', 'watch']
  grunt.registerTask 'test',    ['sass', 'bootcamp']
