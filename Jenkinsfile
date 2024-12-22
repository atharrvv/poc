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
        //             docker.build('keanu.azurecr.io/backend-s', './backend')
        //         }
        //     }
        // }
        // stage ('Backend to ACR') {
        //     steps {
        //         script {
        //             docker.withRegistry('https://keanu.azurecr.io', 'acr') {
        //                 docker.image("keanu.azurecr.io/backend-s:latest").push()
        //             }
        //         }
        //     }
        // }
        stage ('Backend Apply') {
            steps {
                script {
                    withCredentials([azureServicePrincipal('azure_principle')]) {
                        sh 'az aks get-credentials --resource-group group --name rolex'
                        sh """
                        kubectl create secret generic db-credentials \
                        --from-literal=DB_URL=${DB_URL} \
                        --from-literal=DB_USER=${DB_USER} \
                        --from-literal=DB_PASSWORD=${DB_PASSWORD}
                        """
                        // sh 'kubectl apply -f ./yamlat/backend.yaml'
                    }
                }
            }
        }
        // stage ('IP merege') {
        //     steps {
        //         script {
        //             sh 'bash ./frontend/ip.sh'
        //         }
        //     }
        // }
        // stage ('frontend Build'){
        //     steps {
        //         script {
        //             docker.build('keanu.azurecr.io/frontend', './frontend')
        //         }
        //     }
        // }
        // stage('Frontend to ACR') {
        //     steps {
        //         script {
        //             docker.withRegistry('https://keanu.azurecr.io', 'acr') {
        //                 docker.image("keanu.azurecr.io/frontend:latest").push()
        //             }
        //         }
        //     }
        // }
        // stage ('Frontend apply') {
        //     steps {
        //         script {
        //             withCredentials([azureServicePrincipal('azure_principle')]){
        //                 sh 'az aks get-credentials --resource-group group --name rolex'
        //                 sh 'kubectl apply -f ./yamlat/frontend.yaml'
        //             }
        //         }
        //     }
        // }
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
