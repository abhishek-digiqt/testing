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
            sh 'sudo docker build . -t test-jenkins'
            sh 'sudo docker run -d --name test  --network=host test'
            sh 'sudo docker ps'
        }
        }
        stage("Test"){
            steps{
                sh 'sudo newman run  test.json'
            }
        }
    }
}