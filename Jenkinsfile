pipeline {
    agent any
    environment {
        MY_CRED = credentials('ID')
    }
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
        stage ('Test') {
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
                sh 'docker build -t mohamedmohsen20/spring-petclinic:${BUILD_NUMBER} .'
            }
        }
        stage ('deply') {
            steps {
                sh 'docker run -d --name dev -p 9090:8080 mohamedmohsen20/spring-petclinic:${BUILD_NUMBER} '
            }
        }
        stage ('docker hub') {
            steps {
                sh 'docker login --username  $MY_CRED_USR --password $MY_CRED_PSW '
                sh 'docker push mohamedmohsen20/spring-petclinic:${BUILD_NUMBER} '
            }
        }
    }
}