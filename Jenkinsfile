pipeline {
    agent any
    
    environment {
        DOCKER_HUB_CREDENTIALS = credentials('dockerhub')
        DOCKER_IMAGE_NAME = "jenkins-docker-hub"
        DOCKER_IMAGE_VERSION = "1.0"
    }

    stages {
        stage('Build Image') {
            steps {
                script {
                    sh "docker build -t $DOCKER_IMAGE_NAME:$DOCKER_IMAGE_VERSION ."
                }
            }
        }

        stage('Run Container') {
            steps {
                script {
                    sh "docker run -d --name $DOCKER_IMAGE_NAME-container $DOCKER_IMAGE_NAME:$DOCKER_IMAGE_VERSION"
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    withDockerServer([uri: "https://registry.hub.docker.com", credentialsId: DOCKER_HUB_CREDENTIALS]) {
                        sh "docker tag $DOCKER_IMAGE_NAME:$DOCKER_IMAGE_VERSION ozdormu/jenkins-docker-hub:$DOCKER_IMAGE_VERSION"
                        sh "docker push oozdormu/jenkins-docker-hub:$DOCKER_IMAGE_VERSION"
                    }
                }
            }
        }
    }
}