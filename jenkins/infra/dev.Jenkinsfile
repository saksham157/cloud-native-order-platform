pipeline {
  agent {
    kubernetes {
      label 'jenkins-agent'

      yaml """
apiVersion: v1
kind: Pod
spec:
  serviceAccountName: jenkins
  containers:
  - name: terraform
    image: hashicorp/terraform:latest
    command:
    - cat
    tty: true
"""
    }
  }

  environment {
    ENV = "dev"
  }

  stages {

    stage('Validate Environment') {
      steps {
        container('terraform') {
          sh 'bash jenkins/scripts/validate-env.sh $ENV'
        }
      }
    }

    stage('Setup Tools') {
      steps {
        container('terraform') {
          sh 'bash jenkins/tools/awscli.sh'
        }
      }
    }

    stage('Run Infrastructure') {
      steps {
        container('terraform') {
          sh '''
            echo "Starting Infra Deployment..."
            bash jenkins/pipelines/dev.sh | tee infra.log
          '''
        }
      }
    }

  }

  post {

    success {
      sh 'bash jenkins/scripts/notify.sh "SUCCESS: Dev deployment completed" infra.log'
    }

    failure {
      sh 'bash jenkins/scripts/notify.sh "FAILED: Dev deployment failed" infra.log'
    }

    always {
      archiveArtifacts artifacts: 'infra.log', allowEmptyArchive: true
    }
  }
}