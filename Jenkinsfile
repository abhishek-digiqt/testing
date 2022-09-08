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
                sh 'sudo docker stop newman-script'
                sh 'sudo docker rm newman-script'
                sh 'sudo bash build.sh'
                sh 'sudo bash run.sh'
//                 sh 'sudo docker-compose up --build --force-recreate -d' 
                sh 'sudo docker ps'
            }
        }
        stage('Newman Test') {
            steps {
                sh 'sudo netstat -plnt'
                sh 'sudo newman run newman-script.json --env-var "host=0.0.0.0:4040"'
            }
        }
    }
}
