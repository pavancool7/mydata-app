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
        stage('Push docker file to Docker Hub'){
            steps{
                withCredentials([string(credentialsId: 'docker-hub-pass', variable: 'docker-pass')]) {
                sh "docker login -u pavancool7 -p ${docker-pass}"
                sh "docker push pavancool7/mydata-app:${version}"
            }   
        }

        }
    }
}
def getDockerTag(){
    def tag = sh script: 'git rev-parse HEAD', returnStdout: true
    return tag
    }

