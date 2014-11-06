npm install grunt-bump --save-dev

var bumpFiles = [
    'package.json',
    'bower.json',
    'src/app/package.json',
    'src/app/config.js'
];

bump: {
    options: {
        files: bumpFiles,
        commitFiles: bumpFiles.concat('src/ChangeLog.html'),
        push: false
    }
}

grunt.registerTask('double-bump', function() {
  grunt.config('bump', {
    options: {
        files: differentFiles,
        commitFiles: differentFiles,
        push: false
    },
  });
  return grunt.task.run('bump');
});

grunt bump-only
// edit change log etc
grunt bump-commit
