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
        sh 'cd docker && ./run_tests_dockerized.sh'
        
        stage 'Build'
        sh 'cd docker && ./run_builds_dockerized.sh'

        stage 'Post-test check'
        echo 'This is a fake post-test message'
        
    } catch (err) {
    
            currentBuild.result = "FAILURE"
    
            mail body: "project build error: ${err}" ,
            from: 'robot@build.local',
            subject: 'project build failed',
            to: 'ChieftainY2k@gmail.com'
    
            throw err
    }        

}
