pipeline {
  environment {
    imagename = "hello-world"
    ecrurl = "https://986448038492.dkr.ecr.us-west-2.amazonaws.com"
    ecrcredentials = "ecr:us-west-2:aws-credentials"
    dockerImage = ''
  } 
  agent any
  stages {
    stage('Cloning Git') {
      steps {
                checkout scm

      }
    }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build imagename
        }
      }
    }
   
stage('Deploy Master Image') {
      steps{
        script {
          docker.withRegistry(ecrurl, ecrcredentials) {     
            //dockerImage.push("$BUILD_NUMBER")
             dockerImage.push('1.2.4')

          }
        }
      }
    }

 
    stage('Remove Unused docker image - Master') {
      steps{
        //sh "docker rmi $imagename:$BUILD_NUMBER"
         sh "docker rmi $imagename:latest"
	 sh "aws s3 ls"

      }
    } // End of remove unused docker image for master
  }  
} //end of pipeline
