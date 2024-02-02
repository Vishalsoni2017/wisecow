pipeline {
    agent{
        label{
            label "built-in"
            customWorkspace "/root/accuknow/jenkins"
        }
    }


    stages {
        stage('Clone Repository') {
            steps {
                sh "rm -rf *"
                sh "git clone git@github.com:Vishalsoni2017/wisecow.git"
            }
        }
    
        stage("Create Docker Image"){
            steps{
                sh " cd wisecow && docker build -t vishalsoni2017/accuknow:2.1 ."
            }
        }
        
        stage("Create Kubectl wise pod"){
            steps{
                sh " cd wisecow && kubectl create -f pod-definition.yml"
            }
        }
        
        stage ("Create Kubectl service"){
            steps{
                sh "cd wisecow && kubectl create -f service-definition.yml"
            }
        }
        
    
    }
}
