pipeline {
    agent any
    parameters {
        string(name: 'test_data')
        string(name: 'user_answer_code')
        string(name: 'callback_url')
        string(name: 'image')
    }

    stages {
        stage('pull template') {
            steps {
                script {
                  dir('homework-master') {
                      sh "echo pull template"
                      }
                  }
            }
        }
        stage('pull image') {
            steps {
                script {
                    dir('homework-master') {
                        sh "echo pull image"
                    }
                }
            }
        }
        stage('run script') {
            steps {
                script{
                    dir('homework-master') {
                        sh "echo run script"
                    }
                  }
            }
        }
    }

    post {
        failure{
            sh "echo failure"
            //sh "./success.sh"
        }
        success{
            sh "echo success"
            //sh "./success.sh"
        }
    }
}
