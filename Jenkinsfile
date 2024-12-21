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
        // stage ('Backend Build') {
        //     steps {
        //         script {
        //             docker.build('keanu.azurecr.io/backend', './backend')
        //         }
        //     }
        // }
        // stage ('Backend to ACR') {
        //     steps {
        //         script {
        //             docker.withRegistry('https://keanu.azurecr.io', 'acr') {
        //                 docker.image("keanu.azurecr.io/backend:latest").push()
        //             }
        //         }
        //     }
        // }
        stage ('Backend Apply') {
            steps {
                script {
                    withCredentials([azureServicePrincipal('azure_principle')]) {
                        sh 'az aks get-credentials --resource-group group --name rolex'
                        sh 'kubectl apply -f ./yamlat/backend.yml'
                    }
                }
            }
        }
        stage ('frontend Build'){
            steps {
                script {
                    sh 'bash ./frontend/ip.sh'
                    docker.build('keanu.azurecr.io/frontend', './frontend')
                }
            }
        }
        stage('Frontend to ACR') {
            steps {
                script {
                    docker.withRegistry('https://keanu.azurecr.io', 'acr') {
                        docker.image("keanu.azurecr.io/frontend:latest").push()
                    }
                }
            }
        }
        stage ('Frontend apply') {
            steps {
                script {
                    withCredentials([azureServicePrincipal('azure_principle')]){
                        sh 'az aks get-credentials --resource-group group --name rolex'
                        sh 'kubectl apply -f ./yamlat/frontend.yml'
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
