Feature: Get User By ID

  Background:
    * url 'http://127.0.0.1:8900'
    * def createdUser = karate.callSingle('classpath:user/createUser.feature@createUser')
    * def userId = createdUser.response.id

  Scenario Outline: Retrieve a user by id
    Given path '/user/' + <userId>
    When method get
    Then status <status>
    And match response ==<expectedResponse>

    Examples:
      | userId     | status | expectedResponse
      | userId     | 200    | {"email": "#regex ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$","id": "#number? _ > 0","name": "#string","surname": "#string"}                                              |
      | -1         | 400    | {"errors":[{"location":{"in":"path","name":"id","docPath":"/paths/~1user~1{id}/get/parameters/0/schema","path":""},"message":"must be >= 1"}],"message":"Validation errors"}    |
      | "abc"      | 400    | {"errors":[{"location":{"in":"path","name":"id","docPath":"/paths/~1user~1{id}/get/parameters/0/schema","path":""},"message":"must be integer"}],"message":"Validation errors"} |
      | 0          | 400    | {"errors":[{"location":{"in":"path","name":"id","docPath":"/paths/~1user~1{id}/get/parameters/0/schema","path":""},"message":"must be >= 1"}],"message":"Validation errors"}    |
      | 9999999999 | 404    | {"errors":null,"message":"No user with id 9999999999"}                                                                                                                          |