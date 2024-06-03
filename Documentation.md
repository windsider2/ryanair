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

Notes on Test Fails
1. createUserAndCreateBooking feature file:
   In the scenario with a past date, the application incorrectly allows setting a past date like "2023-05-29". 
   It returns a response code of 201, along with the provided date in the response.
2. userCreate feature file:
   In the scenario with an invalid email, such as 'fdij78gmailcom', the service accepts the email and returns a status code 201 along with the response containing invalid email.
   In the scenario with a null email, the service accepts the email and returns a status code of either 201 or 409 (with the message: 'User with email 'null' already exists').
   Creating users with invalid emails causes the test to fail in the 'Retrieve list of users' scenario in the retrieveAllUsers feature file.
3. retrieveAllUsers feature file:
   The response body verification fails due to the creation of a user with an empty email, as mentioned previously.
  