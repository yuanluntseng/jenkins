pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'my-springboot-app'
        DOCKER_TAG = 'latest'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/your/repo.git'
            }
        }

        stage('Build') {
            steps {
                script {
                    docker.build(DOCKER_IMAGE, '-f Dockerfile .')
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    docker.image(DOCKER_IMAGE).inside {
                        sh 'mvn test'
                    }
                }
            }
        }

        

        stage('Deploy') {
            steps {
                script {
                    docker-compose -f docker-compose.yml up -d
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
