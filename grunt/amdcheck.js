npm install grunt-amdcheck --save-dev

amdcheck: {
    main: {
        options: {
            removeUnusedDependencies: false
        },
        files: [{
            src: [
                'src/app/**/*.js'
            ]
        }]
    }
}

amdcheck:main
