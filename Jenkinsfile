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
                
                sh 'sudo docker logs newman-script'
            }
        }
        stage('Newman Test') {
            steps {
                sh 'netstat -an | awk '$4~/:22$/{print $NF}''
                sh 'sudo newman run newman-script.json --env-var "host=0.0.0.0:4040"'
            }
        }
    }
}
