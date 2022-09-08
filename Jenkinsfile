pipeline {
    agent any
    stages{
        stage("Install Newman"){
            steps{
               sh 'sudo npm install -g newman'
            }
    }
        stage("Build"){
            steps{
            sh 'sudo docker stop $(sudo -S docker ps -q --filter ancestor=newman-jenkins)'
            sh 'sudo docker build . -t newman-jenkins'
            
            sh 'sudo docker rm newman'
            sh 'sudo docker run -d --name newman  --network=host newman'
            sh 'sudo docker ps'
        }
        }
        stage("Test"){
            steps{
                sh 'sudo newman run test.json'
                echo 'nice!!'
            }
        }
    }
}
