Feature: Get User By ID

  Background:
    * url 'http://127.0.0.1:8900'
    * def createdUser = karate.callSingle('classpath:user/userCreate.feature@createUser')
    * def userId = createdUser.response.id

  Scenario: Retrieve a user by id
    Given path '/user/' + userId
    When method get
    Then status 200
    And match response ==
    """
   {
  "email": "#regex ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
  "id": "#number? _ > 0",
  "name": "#string",
  "surname": "#string"
}
    """