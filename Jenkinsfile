pipeline {
    agent any
    stages {
        stage ('AZ login') {
            steps {
                script {
                    withCredentials([azureServicePrincipal('azure_principle')]) {
                        sh 'az login --service-principal -u $AZURE_CLIENT_ID -p $AZURE_CLIENT_SECRET -t $AZURE_TENANT_ID'
                        sh  'az acr login --name keanu'
                        }
                    }
                }
            }
        stage('Build images') {
            steps {
                script {
                    docker.build('keanu.azurecr.io/frontend-h', './frontend')
                    docker.build('keanu.azurecr.io/backend-h', './backend')
                }
            }
        }
        stage('Docker hub') {
            steps {
                script {
                    docker.withRegistry('https://keanu.azurecr.io', 'acr') {
                        docker.image("keanu.azurecr.io/frontend:latest").push()
                        docker.image("keanu.azurecr.io/backend:latest").push()
                    }
                }
            }
        }
        stage ('kubectl apply') {
            steps {
                script {
                    withCredentials([azureServicePrincipal('azure_principle')]){
                        sh 'az aks get-credentials --resource-group group --name rolex'
                        sh 'kubectl apply -f backend.yml'
                        sh 'kubectl apply -f frontend.yml'
                    }
                }
            }
        }
        // stage ('AKS') {
        //     steps {
        //         script{
        //             sh """
        //             az aks get-credentials --resource-group group --name rolex
        //             kubectl apply -f /home/chris/backend-h.yaml
        //             kubectl apply -f /home/chris/frontend-h.yaml
                    
        //             """
                    
        //         }
        //     }
        // }
        
    }
}
