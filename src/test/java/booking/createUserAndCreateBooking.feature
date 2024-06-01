Feature: Booking API tests

  Background:
    * url 'http://127.0.0.1:8900'
    * def DateUtil = Java.type('util.DateUtils')
    * def currentDate = DateUtil.getCurrentDate()
    * def pastDate = DateUtil.getPastDate(12)
    * def futureDate = DateUtil.getFutureDate(3)
    * def userResponse = karate.callSingle('classpath:user/userCreate.feature@createUser')
    * def userId = userResponse.response.id

  @createBooking
  Scenario: Create a booking with valid data and verify schema
    Given path 'booking'
    And request { "date": #(currentDate), "destination": "NYC", "origin": "KRK", "userId": #(userId) }
    When method post
    Then status 201
    And match response ==
    """
    {"date":'#regex ^\\d{4}-\\d{2}-\\d{2}$',"destination":'#regex ^[A-Z]{3}$',"id":'#number? _ > 0',"origin":'#regex ^[A-Z]{3}$',"userId":'#number? _ >0'}
    """

  Scenario Outline: Create a booking with valid and invalid data and verify the responses
    Given path 'booking'
    And request { "date": "<date>", "destination": "<destination>", "origin": "<origin>", "userId": <userId> }
    When method post
    Then status <status>
    And assert responseTime  < 1000
    And match response == <expectedResponse>

    Examples:
      | date           | destination | origin | userId     | status | expectedResponse
      | #(currentDate) | NYC         | KRK    | #(userId)  | 201    | {"date":#(currentDate),"destination":"NYC","id":'#number? _ > 0',"origin":"KRK","userId":#(userId)}                                                                                                                                       |
      | #(futureDate)  | CHI         | ATL    | #(userId)  | 201    | {"date":#(futureDate),"destination":"CHI","id":'#number? _ > 0',"origin":"ATL","userId":#(userId)}                                                                                                                                        |
      # In the given scenario, it appears that the application allows the setting of a late date,
            # such as "2023-05-29", and returns a response code of 201 along with the provided date in the response body.
      | #(pastDate)    | NYC         | KRK    | #(userId)  | 400    | {"date":#(pastDate),"destination":"NYC","id":'#number? _ > 0',"origin":"KRK","userId":#(userId) }                                                                                                                                         |
      | #(currentDate) | null        | KRK    | #(userId)  | 400    | {"errors":[{"location":{"in":"request","name":"body","docPath":"/paths/~1booking/post/requestBody/content/application~1json/schema","path":"/destination"},"message":"must match pattern \"^[A-Z]{3}$\""}],"message":"Validation errors"} |
      | #(currentDate) | NYC         | null   | #(userId)  | 400    | {"errors":[{"location":{"in":"request","name":"body","docPath":"/paths/~1booking/post/requestBody/content/application~1json/schema","path":"/origin"},"message":"must match pattern \"^[A-Z]{3}$\""}],"message":"Validation errors"}      |
      | #(currentDate) | NYC         | KRK    | null       | 400    | {"errors":[{"location":{"in":"request","name":"body","docPath":"/paths/~1booking/post/requestBody/content/application~1json/schema","path":"/userId"},"message":"must be number"}],"message":"Validation errors"}                         |
      | #(currentDate) | NYC         | KRK    | 0          | 400    | {"errors":[{"location":{"in":"request","name":"body","docPath":"/paths/~1booking/post/requestBody/content/application~1json/schema","path":"/userId"},"message":"must be >= 1"}],"message":"Validation errors"}                           |
      | #(currentDate) | NYC         | KRK    | 2147483647 | 404    | {"errors":null,"message":"No user with id 2147483647"}                                                                                                                                                                                    |


