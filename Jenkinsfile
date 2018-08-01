pipeline {
    agent any
    parameters {
        string(name: 'test_data')
        string(name: 'user_answer_code')
        string(name: 'callback_url')
        string(name: 'image')
    }

    stages {
        stage('pull image') {
            steps {
                script {
                    dir('online-coding-master') {
                        sh "sudo chmod -R 777 ../"
                        sh "echo pull image"
                        sh "../build-image.sh"
                    }
                }
            }
        }
        stage('compile') {
            steps {
                script {
                    dir('online-coding-master') {
                        sh "echo compile"
                        sh "../compile.sh"
                    }
                }
            }
        }
        stage('run testcase') {
            steps {
                script{
                    dir('online-coding-master') {
                        sh "echo run testcase"
                        //sh "echo $test_data>>test_data"
                        sh "../run-testcase.sh"
                    }
                  }
            }
        }
    }

    post {
        failure{
            sh "echo failure"
            sh "../cleanup.sh"
        }
        success{
            sh "echo success"
            sh "../cleanup.sh"
        }
    }
}
