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
            }
        }
