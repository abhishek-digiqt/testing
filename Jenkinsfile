pipeline {
    agent any
    stages{
        stage("Install Newman"){
            steps{
               sh 'npm install -g newman'
            }
        }
        stage("Test"){
            steps{
                sh 'newman test.json'
            }
        }
        stage("Build"){
            steps{
            sh 'sudo docker stop test && sudo docker container rm stop'
            sh 'sudo docker build . -t test-jenkins'
            sh 'sudo docker run -p 4040:4040 --name test test-jenkins:latest'
            sh 'sudo docker ps'
        }
        }
    }
}