pipeline {
    agent any

    stages {
        stage('Installing Newman') {
            steps {
                sh 'sudo npm install -g newman'
            }
        }
        stage('Test-Build') {
            steps {
                sh 'sudo docker stop newman-script-test || true'
                sh 'sudo docker rm newman-script-test || true'
                // build
                sh 'sudo docker build . -t newman-script-test -f DockerfileTest'
                //run
                sh 'sudo docker run -d --name newman-script-test --restart=on-failure:5 --network=host newman-script-test'                
                // sh 'sudo docker-compose -f docker-compose-test.yml up --build --force-recreate -d' 
                sh 'sudo docker ps'
            }
        }
        stage('Newman Test') {
            steps {
                sh 'sudo newman run newman-script.json --env-var "host=localhost:4430"'

                echo 'APIs Tested Successfully!'

                sh 'sudo docker stop newman-script-test || true'
                sh 'sudo docker rm newman-script-test || true'
                sh 'sudo docker ps'
            }
        }
        stage('Main-Build') {
            steps {
                sh 'sudo docker stop newman-script || true'
                sh 'sudo docker rm newman-script || true'
                // build
                sh 'sudo docker build . -t newman-script -f DockerfileMain'
                //run
                sh 'sudo docker run -d --name newman-script --restart=on-failure:5 --network=host newman-script'
                // sh 'sudo docker-compose up --build --force-recreate -d'
                sh 'sudo docker ps'
            }
        }
    }
}


// def notifySlack(String buildStatus = 'STARTED') {
//     // Build status of null means success.
//     buildStatus = buildStatus ?: 'SUCCESS'

//     def color

//     if (buildStatus == 'STARTED') {
//         color = '#D4DADF'
//     } else if (buildStatus == 'SUCCESS') {
//         color = '#BDFFC3'
//     } else if (buildStatus == 'UNSTABLE') {
//         color = '#FFFE89'
//     } else {
//         color = '#FF9FA1'
//     }

//     def msg = "${buildStatus}: `${env.JOB_NAME}` #${env.BUILD_NUMBER}:\n${env.BUILD_URL}"

//     slackSend(color: color, message: msg)
// }

// node {
//     try {
//         notifySlack()

//         // Existing build steps.
//     } catch (e) {
//         currentBuild.result = 'FAILURE'
//         throw e
//     } finally {
//         notifySlack(currentBuild.result)
//     }
// }
