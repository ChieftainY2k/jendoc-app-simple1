node {

    stage 'My fake stage message'
    echo 'foo bar test message first'

    stage 'Code checkout'
    checkout scm

    stage 'Running tests'
    // sh 'pwd'
    // sh 'ls -la'
    sh 'cd docker && ./run_tests_dockerized.sh'
    
    
}
