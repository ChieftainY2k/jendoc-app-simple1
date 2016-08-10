node {

    stage 'Pre-flight check'
    echo 'This is a fake message'

    stage 'Code checkout'
    checkout scm

    stage 'Running tests'
    // sh 'pwd'
    // sh 'ls -la'
    sh 'cd docker && ./run_tests_dockerized.sh'
    
    stage 'Post-test check'
    echo 'This is a fake post-test message'

}
