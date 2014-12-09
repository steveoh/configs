npm install grunt-contrib-copy

        copy: {
            main: {
                src: 'src/ChangeLog.html',
                dest: 'dist/ChangeLog.html'
            },
            deploy: {
                src: 'deploy/some.zip',
                dest: 'Z:/Documents/some.zip'
            }
        }
        //copy src to dist
        copy: {
            main: {
                expand: true,
                cwd: 'src/',
                src: '**',
                dest: 'dist/'
            }
        }

'copy:main'
