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
                withCredentials([string(credentialsId: '1', variable: 'dockerpass')]) {
                sh "docker login -u pavancool7 -p ${dockerpass}"
                sh "docker push pavancool7/mydata-app:${version}"
                }   
            }
        }
        stage('kubernetes deployment'){            
            steps{
                sh "chmod +x verchange.sh"
                sh "./verchange.sh ${version}"
                sh "cat myapp1.yml"
                
            //    sh "scp myapp.yml ec2-user@18.116.80.211"              
            //    script{
            //        try{
            //            sh "ssh ec2-user@18.116.80.211 kubectl apply -f myapp.yml"
            //        }catch(error){sh "ssh ec2-user@18.116.80.211 kubectl create -f myapp.yml"}               
            //    }
            //    script{
            //        configs:'myapp1.yml',
            //        kubeconfigid:"my-k8s-config"
            //        enableConfigSubstitution: true
            //    }
                 
            }
        }
        stage("kubernetes deployment"){
           steps{
        //       //withCredentials([sshUserPrivateKey(credentialsId: 'myssh2', keyFileVariable: 'mysshkey')]) {
        //        //sh "chmod 777 /home/ec2-user/pavan1.pem"
        //           sh "scp myapp.yml ec2-user@ip-172-31-7-100" 
        //       // } 
                            kubernetesDeploy(
                configs: 'myapp1.yml',
                kubeconfigId: 'K8S',
                enableConfigSubstitution: true)
           }

        }
    }
}
def getDockerTag(){
    def tag = sh script: 'git rev-parse HEAD', returnStdout: true
    return tag
    }
