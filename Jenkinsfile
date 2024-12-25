pipeline {
    agent any
    environment {
        TF_LOG = 'TRACE'
        TF_LOG_PATH = 'terraform.log'
    }
    stages{
        stage('Checkout'){
            steps{
                git url: 'https://github.com/demuduraviteja/terraformwithoutmodule.git',
                branch: 'master'
            }
        }
        stage('Terraform init'){
            steps{
                bat 'terraform init'
            }
        }
        stage('Terraform plan'){
            steps{
                withCredentials([[$class:'AmazonWebServicesCredentialsBinding',accessKeyVariable: 'AWS_ACCESS_KEY_ID', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY', credentialsId: 'aws-iam-role-ravi']]) {
                    echo "AWS Acess key:${AWS_ACCESS_KEY_ID}"
                    bat 'terraform plan -out=plan.tfplan -input=false'
                }
            }
        }
        stage('Terraform Apply'){
            steps{
                withCredentials([[$class:'AmazonWebServicesCredentialsBinding',accessKeyVariable: 'AWS_ACCESS_KEY_ID', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY', credentialsId: 'aws-iam-role-ravi']]) {
                    echo "AWS Acess key:${AWS_ACCESS_KEY_ID}"
                    bat 'terraform apply -auto-approve plan.tfplan'
                }
            }
        }
    }
}
