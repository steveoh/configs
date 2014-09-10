grunt-contrib-imagemin
grunt-newer

imagemin: {
    main: {
        options: {
            optimizationLevel: 3
        },
        files: [{
            expand: true, // Enable dynamic expansion
            cwd: 'src/', // Src matches are relative to this path
            src: ['**/*.{png,jpg,gif}'], // Actual patterns to match
            dest: 'src/' // Destination path prefix
        }]
    }
},

newer:imagemin:main
