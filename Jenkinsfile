pipeline {
    agent any

    environment{
        registry = 'leph3/house-price-prediction-api-iac'
        registryCredential = 'dockerhub'
    }

    stages {
        stage('Deploy') {
            agent {
                kubernetes {
                    containerTemplate {
                        name 'helm' // Name of the container to be used for helm upgrade
                        image 'jenkins/jenkins:latest-jdk25' // The image containing helm
                        alwaysPullImage true // Always pull image in case of using the same tag
                    }
                }
            }
            steps {
                script {
                    container('helm') {
                        sh("helm upgrade --install hpp ./helm-charts/hpp --namespace model-serving")
                    }
                }
            }
        }
    }
}
