pipeline {
    agent any
    parameters {
        string(name: 'test_data')
        string(name: 'user_answer_code')
        string(name: 'callback_url')
        string(name: 'image')
        string(name: 'language')
        string(name: 'compile')
        string(name: 'execute')
        string(name: 'sourcePostfix')
        string(name: 'executePostfix')
    }
    stages {
        stage('pull image') {
            steps {
                script {
                    dir('online-coding-master') {
                        sh "sudo chmod -R 777 ../"
                        sh "echo pull image"
                        sh "../ADD-SINGLE-LANGUAGE-ONLINE-CODING-SUBMISSION/build-image.sh"
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

                          if("${param.compile}"!=""){
                            timeout(time:20,unit:'SECONDS'){
                              sh "../ADD-SINGLE-LANGUAGE-ONLINE-CODING-SUBMISSION/compile.sh"
                            }
                          }
                        } catch (e) {
                            env.STATUS = '1'
                            env.LOCAL_ERROR = '编译超时(20s)'
                            error(env.LOCAL_ERROR)
                        }
                        try {
                          sh "../ADD-SINGLE-LANGUAGE-ONLINE-CODING-SUBMISSION/check_compile_error.sh"
                        } catch (e) {
                          env.STATUS = '2'
                          env.LOCAL_ERROR = '编译错误'
                          error(env.LOCAL_ERROR)
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
                            timeout(time:20,unit:'SECONDS'){
                              sh "../ADD-SINGLE-LANGUAGE-ONLINE-CODING-SUBMISSION/run_testcase.sh"
                            }
                        } catch (e) {
                            String err = e
                            if (err.contains("exit code 1")){
                              env.STATUS = '4'
                              env.LOCAL_ERROR = '运行结果错误'
                              error(env.LOCAL_ERROR)
                            } else {
                              env.STATUS = '3'
                              env.LOCAL_ERROR = '运行超时(20s)'
                              error(env.LOCAL_ERROR)
                            }
                        }
                    }
                  }
            }
        }
    }

    post {
        failure{
            sh "echo failure"
            sh "./ADD-SINGLE-LANGUAGE-ONLINE-CODING-SUBMISSION/failure.sh"
            sh "./ADD-SINGLE-LANGUAGE-ONLINE-CODING-SUBMISSION/cleanup.sh"
        }
        success{
            sh "echo success"
            sh "./ADD-SINGLE-LANGUAGE-ONLINE-CODING-SUBMISSION/success.sh"
            sh "./ADD-SINGLE-LANGUAGE-ONLINE-CODING-SUBMISSION/cleanup.sh"
        }
    }
}
