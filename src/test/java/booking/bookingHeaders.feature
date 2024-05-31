Feature: Booking API Headers tests

  Background:
    * url 'http://127.0.0.1:8900'
    * def DateUtil = Java.type('util.DateUtils')
    * def currentDate = DateUtil.getCurrentDate()
    * def currentDateTime = DateUtil.getCurrentDateTime()
    * def javaZonedTime = Java.type('java.time.ZonedDateTime')
    * def javaTimeFormatter = Java.type('java.time.format.DateTimeFormatter')
    * def dateTimeFormatter = javaTimeFormatter.RFC_1123_DATE_TIME
    * def cronoUnit = Java.type('java.time.temporal.ChronoUnit')

  Scenario: Verify response headers
    Given path 'booking'
    And request { "date": #(currentDate), "destination": "NYC", "origin": "KRK", "userId": 1 }
    When method post
    Then status 201
    And match responseHeaders['X-Powered-By'] == ['Express']
    And match responseHeaders['content-type'] == ['application/json']
    * def parsedDate = javaZonedTime.parse(responseHeaders['Date'][0], dateTimeFormatter)
    * def truncatedDate = parsedDate.truncatedTo(cronoUnit.MINUTES)
    And assert truncatedDate == currentDateTime
    And match responseHeaders['Connection'] == ['keep-alive']
    And match responseHeaders['Keep-Alive'] == ['timeout=5']
    And match responseHeaders['Transfer-Encoding'] == ['chunked']
    And match responseHeaders['Set-Cookie'] == '#array'