pipeline {
    agent any
    stages {
        stage ('git checkout') {
            steps {
                echo 'start git checkout stage'
                git branch: 'main', url: 'https://github.com/mohamedmohsen20/spring-petclinic.git'
            }
        }
        stage ('build') {
            steps {
                echo 'start maven build stage'
                sh 'mvn clean'
            }
        }
        stage ('test') {
            steps {
                echo 'start testing stage'
                sh 'mvn test'
            }
        }
        stage ('packaging') {
            steps {
                sh 'mvn package'
            }
        }
        stage ('build image') {
            steps {
                sh 'docker build -t spring-petclinic:${BUILD_NUMBER} .'
            }
        }
        stage ('deply') {
            steps {
                sh 'docker run -d --name dev -p 9090:8080 spring-petclinic:${BUILD_NUMBER} '
            }
        }
    }
}