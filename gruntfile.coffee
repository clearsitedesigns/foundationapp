module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON("package.json")
    sass:
      options:
        includePaths: ["bower_components/foundation/scss"]

      dist:
        options:
          outputStyle: "compressed"

        files:
          "css/app.css": "scss/app.scss"

    coffee:
      all:
        expand: true
        flatten: true
        cwd: "resources"
        src: ["app.coffee"]
        dest: "js"
        ext: ".js"

    connect:
      server:
        options:
          protocol: "http"
          port: 8000
          keepalive: false
          base: "."

    watch:
      options:
        atBegin: true
        livereload: true

      sass:
        files: "scss/**/*.scss"
        tasks: ["sass"]

      coffee:
        files: ["resources/**/*.coffee"]
        tasks: ["coffee"]

  grunt.loadNpmTasks "grunt-sass"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-contrib-connect"
  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.registerTask "build", ["sass"]
  grunt.registerTask "default", [
    "build"
    "connect"
    "watch"
  ]
  return
