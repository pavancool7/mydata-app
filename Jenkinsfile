pipeline{
    agent any
    environment{
        version= getDockerTag()
    }
    stages{
        stage('Build docker image'){
            steps{
                sh "docker build -t pavancool7/mydata-app:${version}"
            }
        }
    }
}
def getDockerTag(){
    def tag = sh script: 'git rev-parse HEAD', returnStdout: true
    return tag
}

