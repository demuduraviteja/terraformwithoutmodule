pipeline {
    agent any
    stages{
        stage('Checkout'){
            steps{
                git url: 'https://github.com/demuduraviteja/terraformwithoutmodule.git',
                branch: 'master'
            }
        }
        stage('Terraform init'){
            steps{
                sh 'terraform init'
            }
        }
        stage('Terraform validate'){
            steps{
                sh 'terraform validate'
            }
        }
        stage('Terraform fmt'){
            steps{
                sh 'terraform fmt'
            }
        }
        stage('Terraform plan'){
            steps{
                sh 'terraform plan'
            }
        }
        stage('Terraform Apply'){
            steps{
                sh 'terraform apply --auto-approve'
            }
        }
    }
}