# qa-api-challenge
AppPerformance is an application that exposes a REST API.

It’s composed of two resources:
- user
- booking

It’s possible to create users and associate bookings with users.

## Instructions
- Install Docker
- Import app image to Docker like this: `docker load -i api_testing_service_latest.tar.xz`
- Start demo app like this: `docker run -d -p 8900:8900 --name apiservice api_testing_service`
- Swagger is available at http://127.0.0.1:8900/docs

## Requirements
- Please write automatic API tests for the resources exposed by the application (feel free to show us all your skills).
- Use any one of the following languages: Java (maven, junit), JavaScript or Python
- Provide documentation on how to run the tests
- Provide documentation explaining your choices regarding test framework and implemented tests
- Show reporting for your results

## Nice to have
- We are fans of BDD and Karate framework in Ryanair, use this if you can
