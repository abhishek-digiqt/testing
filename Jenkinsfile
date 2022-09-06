pipeline {
    agent any
    stages{
        stage("Install Newman"){
            steps{
                npm install -g newman
            }
        }
        stage("Test"){
            steps{
                newman test.json
            }
        }
        stage("Build"){
            sudo docker stop test && sudo docker container rm stop
            sudo docker build . -t test-jenkins
            sudo docker run -p 4040:4040 --name test test-jenkins:latest
            sudo docker ps
        }
    }
}