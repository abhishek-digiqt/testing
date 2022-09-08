pipeline {
    agent any

    stages {
        stage('Install Newman') {
            steps {
                sh 'sudo npm install -g newman'
            }
        }
        stage('Echo') {
            steps {
                echo 'echo what!!!'
            }
        }
        stage('Build') {
            steps {
                echo 'log 0'
                sh 'sudo docker build . -t newman-jenkins:latest'
                echo 'log 1'
                sh 'sudo docker run -d --name newman --restart=on-failure:5 --network=host newman-jenkins'
                echo 'log 2'
                sh 'sudo docker ps'
            }
        }
        stage('Test') {
            steps {
                sh 'sudo newman run test.json'
            }
        }
    }
}
