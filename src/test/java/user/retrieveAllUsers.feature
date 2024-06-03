Feature: Get All Users

  Background:
    * url 'http://127.0.0.1:8900'

  Scenario: Retrieve list of users
    Given path '/user'
    When method get
    Then status 200
    #The response body verification fails because a user with an empty email was created.
      # Please refer to the comments in the userCreate feature file for more details.
    And match each response ==
    """
   {
  "email": "#regex ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
  "id": "#number? _ > 0",
  "name": "#string",
  "surname": "#string"
}
    """