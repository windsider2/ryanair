Feature: Get All Users

  Background:
    * url 'http://127.0.0.1:8900'

  Scenario: Retrieve list of users
    Given path '/user'
    When method get
    Then status 200
    And match each response ==
    """
   {
  "email": "#regex ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
  "id": "#number? _ > 0",
  "name": "#string",
  "surname": "#string"
}
    """