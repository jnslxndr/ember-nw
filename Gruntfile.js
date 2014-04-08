module.exports = function (grunt) {
  grunt.initConfig({
    pkg: grunt.file.readJSON('app/assets/package.json'),
    nodewebkit: {
      options: {
        build_dir: './build', // Where the build version of my node-webkit app is saved
        mac: true, // We want to build it for mac
        win: true, // We want to build it for win
        linux32: false, // We don't need linux32
        linux64: false, // We don't need linux64
        version: '0.8.4',
        zip: false,
        // mac_icns: 'app/assets/App.icns',
        timestamped_builds: false,
        app: {
          name: "Ember Node-Webkit"
        }
      },
      src: './dist/**/*' // Your node-webkit app
    },
    availabletasks: {
        tasks: {
          options: {
            descriptions: {
                'tasks' : 'A list of available tasks.',
                'build': 'Builds the app as a node-webkit app package'
            },
            filter: 'exclude',
            tasks: ['availabletasks']
          }
        }
    }
  });

  grunt.loadNpmTasks('grunt-available-tasks');
  grunt.loadNpmTasks('grunt-node-webkit-builder');

  grunt.registerTask('tasks', ['availabletasks']);

  grunt.registerTask('build',['nodewebkit']);
  grunt.registerTask('default', ['build']);

};
