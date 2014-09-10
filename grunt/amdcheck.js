grunt-amdcheck

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
