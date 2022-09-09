pipeline {
    agent any

    stages {
        stage('Installing Newman') {
            steps {
                sh 'sudo npm install -g newman'
            }
        }
        stage('Test Build') {
            steps {
                // sh 'sudo docker stop newman-script-test'
                // sh 'sudo docker rm newman-script-test'
                // build
                // sh 'sudo docker stop $(sudo -S docker ps -q --filter ancestor=newman-script-test)'
                // sh 'sudo docker build . -t newman-script-test -f DockerfileTest'
                //run
                // sh 'sudo docker run -d --name newman-script-test --restart=on-failure:5 --network=host --hostname localhost newman-script-test'
                
//                 sh 'sudo bash build.sh'
//                 sh 'sudo bash run.sh'
                sh 'sudo docker-compose -f docker-compose-test.yml up --build --force-recreate -d' 
                sh 'sudo docker ps'
            }
        }
        stage('Newman Test') {
            steps {
                sh 'sudo netstat -tln'
                // sh 'sudo lsof -i :4043'
                sh 'sudo newman run newman-script.json --env-var "host=localhost:4044/"'

                echo 'APIs Tested Successfully!'

                sh 'sudo docker stop newman-script-test'
                sh 'sudo docker rm newman-script-test'
                sh 'sudo docker ps'
            }
        }
        stage('Main Build') {
            steps {
                // sh 'sudo docker stop newman-script'
                // sh 'sudo docker rm newman-script'
                // build
//                 sh 'sudo docker stop $(sudo -S docker ps -q --filter ancestor=newman-script)'
                // sh 'sudo docker build . -t newman-script'
                //run
                // sh 'sudo docker run -d --name newman-script --restart=on-failure:5 --network=host newman-script'
                sh 'sudo docker-compose up --build --force-recreate -d'
                sh 'sudo docker ps'
            }
        }
    }
}
