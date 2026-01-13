pipeline {
    agent any

    environment {
        JAVA_HOME = tool 'java11' // Jenkins Java tool setup name
        MAVEN_HOME = tool 'Maven' // Jenkins Maven tool setup name
        PATH = "${JAVA_HOME}/bin:${MAVEN_HOME}/bin:${env.PATH}"
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'git@github.com:amitopenwriteup/java11-examples.git', credentialsId: 'your-ssh-credentials-id'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean compile'
            }
        }

        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }

        stage('Package') {
            steps {
                sh 'mvn package'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying application...'
                // Add deployment steps here (e.g., copy files, run scripts)
            }
        }
    }

    post {
        always {
            echo 'Cleaning up...'
            deleteDir()
        }
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
