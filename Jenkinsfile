pipeline {

  agent {
    label any
  }
  environment {
    FOO = "BAR"
  }
  
  stages {
    stage("first stage") {
      steps {
        timeout(time: 5, unit: 'MINUTES') {
          echo "test"
          sh "echo mvn -version" 
        }
      }
      
      // Post can be used both on individual stages and for the entire build.
      post {
        success {
          echo "Only when we haven't failed running the first stage"
        }
        
        failure {
          echo "Only when we fail running the first stage."
        }
      }
    }
    
    stage('second stage') {
      steps {
        echo "This time, the Maven version should be 3.3.9"
        sh "echo mvn -version"
      }
    }
  }
  
  post {
    // Always runs. And it runs before any of the other post conditions.
    always {
      deleteDir()
    }
  }
  
  // The options directive is for configuration that applies to the whole job.
  options {
    buildDiscarder(logRotator(numToKeepStr:'10'))
    timeout(time: 60, unit: 'MINUTES')
  }

}
