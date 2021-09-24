pipeline {
  environment {
    imagename = "hello-world"
    ecrurl = "https://986448038492.dkr.ecr.us-west-2.amazonaws.com"
    ecrcredentials = "ecr:us-west-2:aws-credentials"
    dockerImage = ''
   // AWS_DEFAULT_REGION = us-west-2
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
          //dockerImage = docker.build imagename
          dockerImage = docker.build(imagename,"--build-arg STRIPE_KEY=abc -f Dockerfile .")
        }
      }
    }
   
stage('Deploy Master Image') {
      steps{
        script {
          docker.withRegistry(ecrurl, ecrcredentials) {     
            //dockerImage.push("$BUILD_NUMBER")
             dockerImage.push('1.2.5')

          }
        }
      }
    }

 
    stage('Remove Unused docker image - Master') {
      steps{
        //sh "docker rmi $imagename:$BUILD_NUMBER"
         sh "docker rmi $imagename:latest"
	       sh "aws ecr describe-repositories --region us-west-2"

      }
    } // End of remove unused docker image for master
  }  
} //end of pipeline

