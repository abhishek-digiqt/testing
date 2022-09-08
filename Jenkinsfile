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
                sh 'sudo docker build . -t newman-jenkins'
            }
            steps {
               sh 'sudo docker rm newman'
            }
            steps {
               sh 'sudo docker run -d --name newman --restart=on-failure:5 --network=host newman'
            }
            steps {
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
