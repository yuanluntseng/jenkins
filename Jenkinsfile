pipeline {
    agent any // or specify a label for an agent with Docker installed

    stages {
        stage('Build and Deploy with Docker Compose') {
            steps {
                script {
                    // Run the docker-compose command
                    sh 'docker-compose up --build -d'
                }
            }
        }
    }
}
