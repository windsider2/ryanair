Feature: Booking API tests

  Background:
    * url baseUrl
    * def DateUtil = Java.type('util.DateUtils')
    * def currentDate = DateUtil.getCurrentDate()
    * def notExistingUserId = 9999999999

  Scenario: Create and retrieve bookings for defined user ID and date
    Given def createdBooking = karate.callSingle('classpath:examples/booking/create-booking.feature@createBooking')
    And def userId = createdBooking.userId
    When path 'booking'
    And param user = userId
    And param date = currentDate
    And method get
    Then status 200
    And match each response ==
    """
  {"date": "#(currentDate)",
  "destination": "#regex ^[A-Z]{3}$",
  "id": "#number? _ > 0",
  "origin": "#regex ^[A-Z]{3}$",
  "userId": #(userId)}
    """

  Scenario: Try to retrieve bookings for not existing user
    * def errorMessage = 'No user with id ' + notExistingUserId
    Given path 'booking'
    And param user = notExistingUserId
    And param date = currentDate
    And method get
    Then status 404
    And match response ==
    """
    {
      "errors": null,
      "message": '#(errorMessage)'
    }
    """