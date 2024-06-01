HOW TO RUN TESTS
1. Clone the project: git clone https://github.com/RyanairLabs/qa-api-challenge-windsider2.git
2. Download graalvm-jdk-17
3. Set HOME_JAVA system variable with path to the JDK
4. Verify Java version: java --version
5. Install js: cd ./.jdks/graalvm-jdk-17/bin
execute command 'gu install js'
6. Verify js is installed: gu list
7. Install Docker
8. Import app image to Docker like this: docker load -i api_testing_service_latest.tar.xz
9. Start demo app like this: docker run -d -p 8900:8900 --name apiservice api_testing_service
10. In terminal execute command 'mvn clean test'
