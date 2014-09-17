grunt-ssh

deployDir = 'FiberAvailabilityMap',
secrets;
try {
    secrets = grunt.file.readJSON('secrets.json');
} catch (e) {
// swallow for build server
    secrets = {
        stageHost: '',
        prodHost: '',
        username: '',
        password: ''
    };
}

secrets: secrets,
sftp: {
    stage: {
        files: {
            './': 'deploy/deploy.zip'
        },
        options: {
            host: '<%= secrets.stageHost %>'
        }
    },
    prod: {
        files: {
            './': 'deploy/deploy.zip'
        },
        options: {
            host: '<%= secrets.prodHost %>'
        }
    },
    options: {
        path: './' + deployDir + '/',
        srcBasePath: 'deploy/',
        username: '<%= secrets.username %>',
        password: '<%= secrets.password %>',
        showProgress: true
    }
},
sshexec: {
    options: {
        username: '<%= secrets.username %>',
        password: '<%= secrets.password %>'
    },
    stage: {
        command: ['cd ' + deployDir, 'unzip -oq deploy.zip', 'rm deploy.zip'].join(';'),
        options: {
            host: '<%= secrets.stageHost %>'
        }
    },
    prod: {
        command: ['cd ' + deployDir, 'unzip -oq deploy.zip', 'rm deploy.zip'].join(';'),
        options: {
            host: '<%= secrets.prodHost %>'
        }
    }
}

sftp:stage
sshexec:stage
