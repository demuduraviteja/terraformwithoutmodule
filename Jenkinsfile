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
        stage('Terraform plan'){
            steps{
                withCredentials([[$class:'AmazonWebServicesCredentialsBinding',accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'aws-iam-role-ravi', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                    echo "AWS Acess key:${AWS_ACCESS_KEY_ID}"
                    sh 'terraform plan -out=plan.tfplan'
                }
            }
        }
        stage('Terraform Apply'){
            steps{
                withCredentials([[$class:'AmazonWebServicesCredentialsBinding',accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'aws-iam-role-ravi', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                    echo "AWS Acess key:${AWS_ACCESS_KEY_ID}"
                    sh 'terraform apply plan.tfplan --auto-approve'
                }
            }
        }
    }
}