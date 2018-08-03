pipeline {
    agent any
    parameters {
        string(name: 'test_data')
        string(name: 'user_answer_code')
        string(name: 'callback_url')
        string(name: 'image')
        string(name: 'RUNTESTCASE_ERROR',defaultValue:'FALSE')
        
        // 0-默认值；1-编译超时；2-编译错误；3-运行超时；4-运行错误；5-成功
    }
    environment { 
        CC = 'clang'
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
                          // 后台运行编译脚本,并设置timeout为20s
                          timeout(time:20,unit:'SECONDS'){
                            sh "../compile.sh"
                          }
                        } catch (e) {
                            
                            env.LOCAL_ERROR = '编译超时(20s)'
                            error(env.LOCAL_ERROR)
                        }
                        try {
                          sh "../check_compile_error.sh"
                        } catch (e) {
                         
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
                              sh "../run_testcase.sh"
                            }
                        } catch (e) {
                            env.CC="code"
                            sh "echo $CC"
                            env.LOCAL_ERROR = '运行超时(20s)'
                            error(env.LOCAL_ERROR)
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
            sh "./cleanup.sh"
        }
        success{
            sh "echo success"
            sh "./success.sh"
            sh "./cleanup.sh"
        }
    }
}
