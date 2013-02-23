module.exports = (grunt)->
  'use strict'

  # Project configuration.
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')
    jshint:
      options:
        jshintrc: '.jshintrc'
      lib:
        src: ['src/lib/**/*.js']
      test:
        src: ['src/test/**/*.js']
    copy:
      main:
        files: [
            expand: true
            cwd: 'src/'
            src: ['**/*.js']
            dest: 'bin/'
        ]
    coffeelint:
      gruntfile:
        src: 'Gruntfile.coffee'
      lib:
        src: ['src/lib/*.coffee']
      test:
        src: ['src/test/*.coffee']
      options:
        no_trailing_whitespace:
          level: 'error'
        max_line_length:
          level: 'warn'
    coffee:
      #compile:
      #  files:
      #    'bin/lib/vendor.js': ['src/vendor/*.coffee']
      lib:
        expand: true
        cwd: 'src/lib/'
        src: ['**/*.coffee']
        dest: 'bin/lib/'
        ext: '.js'
      #test:
      #  expand: true
      #  cwd: 'src/test/'
      #  src: ['**/*.coffee']
      #  dest: 'bin/test/'
      #  ext: '.js'
    simplemocha:
      all:
        src: [
          'node_modules/should/lib/should.js'
          'bin/test/**/*.js'
        ]
        options:
          globals: ['should']
          timeout: 3000
          ignoreLeaks: false
          #grep: '**/*.js'
          ui: 'bdd'
          reporter: 'tap'
    watch:
      gruntfile:
        files: '<%= coffeelint.gruntfile.src %>'
        tasks: ['coffeelint:gruntfile']
      jsLib:
        files: '<%= jshint.lib.src %>'
        tasks: ['jshint:lib']
      jsTest:
        files: '<%= jshint.test.src %>'
        tasks: ['jshint:test', 'simplemocha']
      cofffeLib:
        files: '<%= coffeelint.lib.src %>'
        tasks: ['coffeelint:lib']
      cofffeTest:
        files: '<%= coffeelint.lib.src %>'
        tasks: ['coffeelint:test', 'simplemocha']
    clean: ['bin/']

  # plugins.
  grunt.loadNpmTasks 'grunt-simple-mocha'
  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-jshint'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  # tasks.
  grunt.registerTask 'compile', [
    'coffeelint'
    'jshint'
    'copy'
    'coffee'
  ]

  grunt.registerTask 'default', [
    'compile'
    'simplemocha'
  ]

