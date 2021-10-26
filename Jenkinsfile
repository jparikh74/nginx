pipeline {
    agent any
    stages {
        stage('List production S3 buckets') {
            steps {
                withAWS(roleAccount:'139303663434', role:'AllowAltirJenkins') {
                    sh 'aws s3 ls'
                }
            }
        }
    }
}
