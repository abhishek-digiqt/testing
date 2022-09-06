pipeline {
    agent any
    stages{
        stage("Install Newman"){
            steps{
               sh 'sudo npm install -g newman'
            }
        }
        stage("Test"){
            steps{
                sh 'sudo newman run  test.json'
            }
        }
        stage("Build"){
            steps{
            sh 'sudo docker build . -t test-jenkins'
            sh 'sudo docker run -p 4040:4040 --name test test-jenkins:latest'
            sh 'sudo docker ps'
        }
        }
    }
}