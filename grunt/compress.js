        compress: {
            main: {
                options: {
                    archive: 'deploy/some.zip'
                },
                files: [{
                    src: ['**', '!build-report.txt', '!util/**'],
                    dest: '/websiteFolder',
                    cwd: 'dist/',
                    expand: true
                }]
            },
            update: {
                options: {
                    archive: 'deploy/partial_update.zip'
                },
                files: [{
                    src: ['dojo/dojo.*', 'app/**', '!dojo/dojo.profile.js'],
                    dest: '/websiteFolder',
                    cwd: 'dist/',
                    expand: true
                }]
            }
        }
