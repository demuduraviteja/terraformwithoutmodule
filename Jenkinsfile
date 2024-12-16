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
                sh 'terraform init'
            }
        }
        stage('Terraform plan'){
            steps{
                withCredentials([[$class:'AmazonWebServicesCredentialsBinding',accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'aws-iam-role-ravi', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                    echo "AWS Acess key:${AWS_ACCESS_KEY_ID}"
                    sh 'terraform plan -out=plan.tfplan -input=false'
                }
            }
        }
        stage('Terraform Apply'){
            steps{
                withCredentials([[$class:'AmazonWebServicesCredentialsBinding',accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'aws-iam-role-ravi', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                    echo "AWS Acess key:${AWS_ACCESS_KEY_ID}"
                    sh 'terraform apply -input=false plan.tfplan'
                }
            }
        }
    }
}
