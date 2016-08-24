node("master") {

    currentBuild.result = "SUCCESS"
    env.MYVAR = "foobar"

    try {
        
        stage 'Pre-flight check'
        echo "This is a pre-flight check message, ENV check."
        sh 'env'
    
        stage 'Code checkout'
        checkout scm
        //echo "My branch is: ${env.BRANCH_NAME}"
    
        //stage 'Fail tests'
        //sh 'domething to fail'

        stage 'Unit tests'
        sh 'cd docker && TEST_TYPE=unit ./run_tester_dockerized.sh'

        stage 'Smoke tests'
        sh 'cd docker && TEST_TYPE=smoke ./run_tester_dockerized.sh'

        stage 'Database tests'
        sh 'cd docker && TEST_TYPE=database ./run_tester_dockerized.sh'

        //stage 'Running CloverPublisher'
        //step([$class: 'CloverPublisher', cloverReportDir: '/tmp/test-reports/', cloverReportFileName: 'clover-coverage.xml'])
        
        //stage 'Build'
        //sh 'cd docker && ./run_builds_dockerized.sh'

        stage 'Post-pipeline check'
        echo 'This is a fake post-stage message'
        
    } catch (err) {
    
        currentBuild.result = "FAILURE"

        mail(
            subject: "[FAIL] Build ${env.BUILD_NUMBER} for job ${env.JOB_NAME} FAILED",
            body: "Build ${env.BUILD_NUMBER} FAILED, see ${env.BUILD_URL}" ,
            from: "robot@build.local",
            to: "ChieftainY2k@gmail.com");

        throw err
    }

    mail(
        subject: "[SUCCESS] Build ${env.BUILD_NUMBER} for job ${env.JOB_NAME} SUCCESSFUL",
        from: 'robot@build.local',
        mail body: "Build ${env.BUILD_NUMBER} was SUCCESSFUL, see ${env.BUILD_URL}" ,
        to: 'ChieftainY2k@gmail.com');

    echo "BUILD RESULT: ${currentBuild.result}"

}
