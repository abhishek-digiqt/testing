pipeline {
    agent any

    stages {
        stage('Installing Newman') {
            steps {
                sh 'sudo npm install -g newman'
            }
        }
        stage('Build') {
            steps {
                sh 'sudo docker rm newman-script'
                sh 'sudo docker-compose up --build --force-recreate -d' 
                sh 'sudo docker ps'
            }
        }
        stage('Newman Test') {
            steps {
                sh 'sudo newman run newman-script.json --global-var "port=4040"'
            }
        }
    }
}
