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
10. In terminal execute command 'mvn clean test verify'

How to Generate and View Reports

1. After running tests navigate to target/cucumber-html-reports directory
2. Find the overview-features.html file within this directory. Right-click on this file.
3. Select Open In -> Browser -> Chrome (or any other browser of your choice) to view the report.

Notes on Test Fails
1. create-booking feature file:
   In the scenario with a past date, the application incorrectly allows setting a past date like "2023-05-29". 
   It returns a response code of 201, along with the provided date in the response.
2. create-user feature file:
   In the scenario with an invalid email, such as 'fdij78gmailcom', the service accepts the email and returns a status code 201 along with the response containing invalid email.
   In the scenario with a null email, the service accepts the email and returns a status code of either 201 or 409 (with the message: 'User with email 'null' already exists').
   Creating users with invalid emails causes the test to fail in the 'Retrieve list of users' scenario in the retrieveAllUsers feature file.
3. retrieve-all-users feature file:
   The response body verification fails due to the creation of a user with an empty email, as mentioned previously.

Test Framework

The test framework is built on the Karate framework and utilizes the Java technology stack.

Key components of the test framework include:

Karate Framework: Chosen because it is already in use by the team, allowing to write tests in BDD style, leverage
existing expertise and maintain technology consistency across projects.

Maven: Employed as the build tool to manage dependencies and streamline the build process.

JUnit 5: Used as the unit test framework to facilitate the execution of test cases.

GraalVM JDK 17: Utilized as the Java Development Kit. GraalVM is necessary because Karate uses JavaScript for scripting
within feature files (e.g., karate-config.js, custom functions). GraalVM includes a highly optimized JavaScript engine,
Graal.js, which enhances performance and compatibility for these scripts.

Cucumber Reporting: Integrated to generate and expose common reports.

Test Design and Creation

Test creation is guided by the Swagger API documentation. For each API resource, a set of positive scenarios, covering
creating and retrieving users and bookings, was developed. Additionally, negative scenarios were incorporated to address
potential error conditions and edge cases. For more details, please refer to the feature files, which serve as
executable test cases.

  