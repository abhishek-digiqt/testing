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
                sh 'sudo docker rm newman-script'
                sh 'sudo docker-compose up --build --force-recreate -d' 
                sh 'sudo docker ps'
            }
        }
        stage('Test') {
            steps {
                sh 'sudo newman run test.json --env-var "port=4040"'
            }
        }
    }
}
