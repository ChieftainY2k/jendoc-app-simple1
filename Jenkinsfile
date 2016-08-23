node {

    currentBuild.result = "SUCCESS"
    env.MYVAR = "foobar"

    try {
        
        stage 'Pre-flight check'
        echo "This is a pre-flight check message, ENV check."
        sh 'env'
    
        stage 'Code checkout'
        checkout scm
        echo "My branch is: ${env.BRANCH_NAME}"
    
        stage 'Running tests'
        sh 'cd docker && TEST_TYPE=unit ./run_tests_dockerized.sh'

        //stage 'Running CloverPublisher'
        //step([$class: 'CloverPublisher', cloverReportDir: '/tmp/test-reports/', cloverReportFileName: 'clover-coverage.xml'])
        
        //stage 'Build'
        //sh 'cd docker && ./run_builds_dockerized.sh'

        stage 'Post-pipeline check'
        echo 'This is a fake post-stage message'
        
    } catch (err) {
    
        currentBuild.result = "FAILURE"

        mail body: "project build FAILED: ${err}" ,
        from: 'robot@build.local',
        subject: 'project build failed',
        to: 'ChieftainY2k@gmail.com'

        throw err
    }

    mail body: "project build success" ,
    from: 'robot@build.local',
    subject: 'project build SUCCESS',
    to: 'ChieftainY2k@gmail.com'


    echo "RESULT: ${currentBuild.result}"

}
