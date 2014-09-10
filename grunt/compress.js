grunt-contrib-compress

deployFiles = [
    '**',
    '!build-report.txt',
    '!util/**',
    '!jasmine-favicon-reporter/**',
    '!**/*.uncompressed.js',
    '!**/*consoleStripped.js',
    '!**/*.min.*',
    '!**/tests/**',
    '!**/bootstrap/test-infra/**',
    '!**/bootstrap/less/**'
]

compress: {
    main: {
        options: {
            archive: 'deploy/deploy.zip'
        },
        files: [{
            src: deployFiles,
            dest: './',
            cwd: 'dist/',
            expand: true
        }]
    }
},
        
'compress:main'
