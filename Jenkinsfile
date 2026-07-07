pipeline {
    agent any

    environment {
        REGISTRY = "localhost:5000"
        IMAGE_NAME = "java11-examples"
        IMAGE_TAG = "${BUILD_NUMBER}"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'master',
                    url: 'https://github.com/amitopenwriteup/java11-examples.git'
            }
        }

        stage('Docker Build') {
            steps {
                sh """
                    docker build \
                        -f dockerfile \
                        -t ${REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG} \
                        -t ${REGISTRY}/${IMAGE_NAME}:latest \
                        .
                """
            }
        }

        stage('Docker Push') {
            steps {
                sh """
                    docker push ${REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG}
                    docker push ${REGISTRY}/${IMAGE_NAME}:latest
                """
            }
        }
    }

    post {
        success {
            echo "Docker image pushed successfully."
        }

        failure {
            echo "Pipeline failed."
        }

        always {
            sh 'docker image ls | head'
        }
    }
}
