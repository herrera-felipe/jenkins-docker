pipeline {
  agent any
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub')
  }
  stages {
    stage('Build') {
      steps {
        sh 'docker build -t ozdormu/jenkins-docker-hub:1.0 .'
      }
    }
    stage('Login') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
    stage('Push') {
      steps {
        sh 'docker tag jenkins-docker-hub:1.0 ozdormu/jenkins-docker-hub:1.0'
        sh 'docker push ozdormu/jenkins-docker-hub:1.0'
      }
    }
  }
  post {
    always {
      sh 'docker logout'
    }
  }
}