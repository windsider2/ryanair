Feature: Booking

  Background:
    * url 'http://127.0.0.1:8900'
    * def createdBooking = karate.callSingle('classpath:booking/createUserAndCreateBooking.feature@createBooking')
    * print 'CREATEBOK:', createdBooking
    * def id = createdBooking.response.id
    * def userId = createdBooking.userId
    * def date = createdBooking.currentDate
    * def destination = createdBooking.response.destination
    * def origin = createdBooking.response.origin

  Scenario: Retrieve booking by ID with user ID from userCreate
    Given path '/booking/' + id
    When method get
    Then status 200
    And match response == { date: #(date), destination: #(destination), id: #(id), origin: #(origin), userId: #(userId) }
