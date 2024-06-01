Feature: User Management

  Background:
    * url 'http://127.0.0.1:8900'
    * def TestData = Java.type('util.TestData')
    * def email = callonce read('classpath:util/generate-email.js')
    * def firstName = TestData.getRandomFirstName()
    * def lastName = TestData.getRandomLastName()

  @createUser
  Scenario: Create a user with a new email address
    Given path '/user'
    And request {email: #(email), name: #(firstName), surname: #(lastName)}
    When method post
    Then status 201
    And match response ==
    """
{
  id: '#number? _ > 0',
  email: #(email),
  name: #(firstName),
  surname: #(lastName)
}
"""

  Scenario: Create a user with an existing email address
    * def expectedMessage = 'User with email \'' + email + '\' already exists'
    Given path '/user'
    And request { email: #(email), name: #(firstName), surname: #(lastName) }
    When method post
    Then status 409
    And match response == { errors: null, message: '#(expectedMessage)' }
