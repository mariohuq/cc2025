private void loadVarsFromFile(String path) {
    def file = readFile(path)
        .replaceAll("(?m)^\\s*\\r?\\n", "")  // skip empty line
        .replaceAll("(?m)^#[^\\n]*\\r?\\n", "")  // skip commented lines
    file.split('\n').each { envLine ->
        def (key, value) = envLine.tokenize('=')
        env."${key}" = "${value.trim().replaceAll('^\"|\"$', '')}"
    }
}

pipeline {
    agent { label '2025-kondraev' }

    stages {
        stage('Hello stage') {
            steps {
                build(job: 'kondraev-taskbot-build')
                build(job: 'kondraev-infra-ansible-dev')
                loadVarsFromFile('/home/jenkins/myenv')
                build(job: 'kondraev-taskbot-deploy', parameters: [string(name: 'SERVER_ADDRESS', value: env.DEV_SERVER_IP)])
            }
        }
    }
}