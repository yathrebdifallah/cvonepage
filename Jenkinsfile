pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials')
        IMAGE_NAME = "yathrebdifallah233/cvonepage:latest"
        SLACK_WEBHOOK_ID = 'slack-webhook'
    }

    triggers {
        pollSCM('H/5 * * * *') // scruter GitHub toutes les 5 minutes
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/yathrebdifallah/cvonepage.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${IMAGE_NAME}")
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-credentials') {
                        docker.image("${IMAGE_NAME}").push()
                    }
                }
            }
        }
    }

    post {
        success {
            slackSend(channel: '#general', color: 'good', message: "✅ Pipeline réussi pour ${IMAGE_NAME}")
        }
        failure {
            slackSend(channel: '#general', color: 'danger', message: "❌ Pipeline échoué pour ${IMAGE_NAME}")
        }
    }
}
