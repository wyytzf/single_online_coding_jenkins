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
                        try {
                          sh "echo compile"
                          // 后台运行编译脚本
                          sh "../compile.sh"
                          // 运行时间检测脚本，超时则kill进程,并exit 1抛出错误
                          sh "../time_limit.sh compile.sh"
                        } catch (e) {
                          sh "echo '编译超时'" > result
                        }
                    }
                }
            }
        }
        stage('run testcase') {
            steps {
                script{
                    dir('online-coding-master') {
                        try {
                            sh "echo run testcase"
                            sh "../run-testcase.sh &"
                            // 运行时间检测脚本，超时则kill进程,并exit 1抛出错误
                            //sh "../time_limit.sh run-testcase.sh"
                        } catch (e) {
                            sh "echo '运行超时'" > result
                        }
                    }
                  }
            }
        }
    }

    post {
        failure{
            sh "echo failure"
            sh "./failure.sh"
            //sh "./cleanup.sh"
        }
        success{
            sh "echo success"
            sh "./success.sh"
            //sh "./cleanup.sh"
        }
    }
}
