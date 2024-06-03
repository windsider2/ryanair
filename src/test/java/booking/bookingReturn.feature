Feature: Booking API tests

  Background:
    * url 'http://127.0.0.1:8900'
    * def DateUtil = Java.type('util.DateUtils')
    * def currentDate = DateUtil.getCurrentDate()
    * def userId = 1
    * def notExistingUserId = 9999999999

  Scenario: Create and retrieve bookings for defined user ID and date
    Given path 'booking'
    And request { "date": #(currentDate), "destination": "NYC", "origin": "KRK", "userId": #(userId)}
    And method post
    And status 201
    Then path 'booking'
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