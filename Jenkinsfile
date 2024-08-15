pipeline {
    agent any
    
    // Poll the SCM for changes (alternative to webhook triggers)
    triggers {
        pollSCM('H/5 * * * *') // Polls the repository every 5 minutes (optional)
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from the Git repository
                git branch: 'main', url: 'https://github.com/yuanluntseng/jenkins.git'
            }
        }

        stage('Stop Existing Containers') {
            steps {
                script {
                    // Run docker-compose down to stop and remove existing containers
                    bat 'docker-compose down'
                }
            }
        }

        stage('Build and Deploy New Containers') {
            steps {
                script {
                    // Run docker-compose up with --build and detached mode
                    bat 'docker-compose up --build -d'
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished.'
        }
    }
}
