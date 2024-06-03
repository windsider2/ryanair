Feature: Retrieve booking by booking id

  Background:
    * url 'http://127.0.0.1:8900'
    * def createdBooking = karate.callSingle('classpath:booking/createBooking.feature@createBooking')
    * def id = createdBooking.response.id
    * def userId = createdBooking.userId
    * def date = createdBooking.currentDate
    * def destination = createdBooking.response.destination
    * def origin = createdBooking.response.origin

  Scenario Outline: Retrieve booking by ID with valid and invalid user ID
    Given path '/booking/' + <bookingId>
    When method get
    Then status <status>
    And match response == <expectedResponse>

    Examples:
      | bookingId  | status | expectedResponse
      | id         | 200    | { date: #(date), destination: #(destination), id: #(id), origin: #(origin), userId: #(userId) }                                                                                    |
      | -1         | 400    | {"errors":[{"location":{"in":"path","name":"id","docPath":"/paths/~1booking~1{id}/get/parameters/0/schema","path":""},"message":"must be >= 1"}],"message":"Validation errors"}    |
      | "abc"      | 400    | {"errors":[{"location":{"in":"path","name":"id","docPath":"/paths/~1booking~1{id}/get/parameters/0/schema","path":""},"message":"must be integer"}],"message":"Validation errors"} |
      | 0          | 400    | {"errors":[{"location":{"in":"path","name":"id","docPath":"/paths/~1booking~1{id}/get/parameters/0/schema","path":""},"message":"must be >= 1"}],"message":"Validation errors"}    |
      | 9999999999 | 404    | {"errors":null,"message":"No booking with id 9999999999"}
