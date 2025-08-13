Feature: Kullanici Post request sonucu donen response test eder

  Scenario:  TC01 Post request'e donen response'u kaydedip beklenilen ozelliklerde olmasi gerekir
    * def requestBody = read("rb_td_request.json")
    Given url 'https://restful-booker.herokuapp.com/booking'
    And header Content-Type = 'application/json'
    And header Accept = 'application/json'
    And request requestBody
    When method POST
    Then status 200

    # Gelen response'u variable olarak kaydediyoruz
    * def savedResponse = response

    # Assert ile doğrulama
    And assert savedResponse.booking.firstname == requestBody.firstname
    And assert savedResponse.booking.lastname == requestBody.lastname
    And assert savedResponse.booking.totalprice == requestBody.totalprice
    And assert savedResponse.booking.depositpaid == requestBody.depositpaid
    And assert savedResponse.booking.bookingdates.checkin == requestBody.bookingdates.checkin
    And assert savedResponse.booking.bookingdates.checkout == requestBody.bookingdates.checkout
    And assert savedResponse.booking.additionalneeds == requestBody.additionalneeds
