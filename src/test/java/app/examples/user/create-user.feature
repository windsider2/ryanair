Feature: Create user

  Background:
    * url baseUrl
    * def TestData = Java.type('util.TestData')
    * def email = callonce read('classpath:app/util/generate-email.js')
    * def emailUpdated = read('classpath:app/util/generate-email.js')
    * def firstName = TestData.getRandomFirstName()
    * def lastName = TestData.getRandomLastName()
    * def removeCharacters = read('classpath:app/util/remove-characters.js')
    * def invalidEmail = removeCharacters(email, '@.')

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

  Scenario Outline: Create a user with invalid data
    * def expectedMessage = 'User with email \'' + email + '\' already exists'
    Given path '/user'
    And request { email: '<email>', name: '<firstName>', surname: '<lastName>' }
    When method post
    Then status <status>
    And match response == <expectedResponse>

    Examples:
      | email           | firstName | lastName | status | expectedResponse                                                                                                                                                                                              |
      | #(email)        | John      | Doe      | 409    | { errors: null, message: '#(expectedMessage)' }                                                                                                                                                               |
      # The service accepts an invalid email such as 'fdij78gmailcom' and
            # returns a status code 201 along with the invalid email.
      | #(invalidEmail) | Jain      | Doever   | 400    | {"errors":[{"location":{"in":"request","name":"body","docPath":"/paths/~1user/post/requestBody/content/application~1json/schema","path":"/email"},"message":"must be string"}],"message":"Validation errors"} |
      # The service accepts a null email and
            # returns a status code of either 201 or 409 (with the message: 'User with email 'null' already exists').
      | null            | David     | Bayer    | 400    | { "errors": ["Email address is required"] }                                                                                                                                                                   |
      | #(emailUpdated) | null      | Douglas  | 400    | {"errors":[{"location":{"in":"request","name":"body","docPath":"/paths/~1user/post/requestBody/content/application~1json/schema","path":"/email"},"message":"must be string"}],"message":"Validation errors"} |
      | #(emailUpdated) | Betty     | null     | 400    | {"errors":[{"location":{"in":"request","name":"body","docPath":"/paths/~1user/post/requestBody/content/application~1json/schema","path":"/email"},"message":"must be string"}],"message":"Validation errors"} |
