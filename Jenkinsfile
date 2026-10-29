pipeline {
    agent any

    tools {
        maven 'Maven3'
    }

    environment {
        DOCKER_IMAGE = 'zahaak7/car-service:latest'
        PATH = "C:\\Users\\asrar\\AppData\\Local\\Programs\\DockerDesktop\\resources\\bin;D:\\apache-maven-3.10.0\\bin;${env.PATH}"
    }

    stages {
        stage('Clone Repository') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                bat 'mvn clean package'
            }
        }

        stage('Docker Build') {
            steps {
                bat "docker build -t %DOCKER_IMAGE% ."
            }
        }

        stage('Docker Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    bat 'echo %DOCKER_PASS%| docker login -u %DOCKER_USER% --password-stdin'
                    bat "docker push %DOCKER_IMAGE%"
                }
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                bat 'kubectl delete deployment car-service --ignore-not-found'
                bat 'kubectl apply -f pod.yaml'
            }
        }
    }
}
