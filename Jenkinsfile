pipeline{
    agent any
    environment{
        version= getDockerTag()
    }
    stages{
        stage('Build docker image'){
            steps{
                sh "docker build . -t pavancool7/mydata-app:${version}"
            }
        }
        stage('Push docker file to Docker Hub'){
            steps{
                withCredentials([string(credentialsId: 'docker-hub-pass', variable: 'dockerpass')]) {
                sh "docker login -u pavancool7 -p ${dockerpass}"
                sh "docker push pavancool7/mydata-app:${version}"
                }   
            }
        }
        stage('copying version'){
            steps{
                sh "chmod +x verchange.sh"
                sh "./verchange.sh ${version}"
                sh "cat myapp1.yml"
            //    script{
            //        configs:'myapp1.yml',
            //        kubeconfigid:"my-k8s-config"
            //        enableConfigSubstitution: true
            //    }
                 
            }
        }
        stage("kubernetes deployment"){
            steps{
                withCredentials([sshUserPrivateKey(credentialsId: 'mysshkey', keyFileVariable: 'mysshkey', usernameVariable: 'ec2-user')]) {
                //sh "chmod 777 /home/ec2-user/pavan1.pem"
                sh "scp -i mysshkey myapp1.yml ec2-user@18.116.80.211/home/user" 
                } 
            }
        }
    }
}
def getDockerTag(){
    def tag = sh script: 'git rev-parse HEAD', returnStdout: true
    return tag
    }

