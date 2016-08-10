node {

    currentBuild.result = "SUCCESS"
    env.MYVAR = "foobar"

    try {
        
        stage 'Pre-flight check'
        echo 'This is a fake message'
        sh 'env'
    
        stage 'Code checkout'
        checkout scm
    
        stage 'Running tests'
        // sh 'pwd'
        // sh 'ls -la'
        sh 'cd docker && ./run_tests_dockerized.sh'
        
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
