Feature: User Management

  Background:
    * url 'http://127.0.0.1:8900'
    * def TestData = Java.type('util.TestData')
    * def email = callonce read('classpath:util/generate-email.js')
    * def firstName = TestData.getRandomFirstName()
    * def lastName = TestData.getRandomLastName()

  Scenario: Create a user with a new email address
    Given path '/user'
    And request {email: #(email), name: #(firstName), surname: #(lastName)}
    * print 'The created user email1 is:', email
    When method post
    Then status 201
    And match response ==
    """
{
  id: '#number',
  email: #(email),
  name: #(firstName),
  surname: #(lastName)
}
"""

  Scenario: Create a user with an existing email address
    * def expectedMessage = 'User with email \'' + email + '\' already exists'
    Given path '/user'
    And request { email: #(email), name: #(firstName), surname: #(lastName) }
    * print 'The created user email2 is:', email
    When method post
    Then status 409
    And match response == { errors: null, message: '#(expectedMessage)' }
