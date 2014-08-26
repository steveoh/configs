    esri_slurp: {
      options: {
        version: '3.10'
      },
      dev: {
        options: {
          beautify: true
        },
        dest: 'src/esri',
      },
      travis: {
        options: {
          beautify: false
        }
      }
    }

grunt if-missing:esri_slurp:dev
