npm install grunt-esri-slurp --save-dev

esri_slurp: {
    options: {
        version: '3.10'
    },
    dev: {
        options: {
            beautify: true,
            dest: 'src/esri'
        }
    },
    travis: {
        options: {
            dest: 'src/esri'
        }
    }
}

grunt if-missing:esri_slurp:dev
