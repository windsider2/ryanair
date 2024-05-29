Feature: User End-point

Background:
  * url 'http://127.0.0.1:8900'

Scenario: Create and Retrieve a User

  # Retrieve the created user by ID
  Given path '/user/' + 1
  When method get
  Then status 200
