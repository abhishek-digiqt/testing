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
                sh 'pwd && ls'
                sh 'sudo docker ps'
                sh 'sudo bash ./build.sh'
                echo 'log 1'
                sh 'sudo bash ./run.sh'
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
