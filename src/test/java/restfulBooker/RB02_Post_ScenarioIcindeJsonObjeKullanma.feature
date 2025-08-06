Feature: Kullanici Post request sonucu donen response test eder



    
  Scenario: TC01 Post request'e donen response'in beklenilen ozelliklerde olmasi gerekir
    # json data formatinda açtığımız  file'daki request'imizi bu şekide  scenarionun altında  atama yapabiliriz.
    * def requestBody = read("rb_td_request.json")
    Given url 'https://restful-booker.herokuapp.com/booking'
    And header Content-Type = 'application/json'
    And header Accept = 'application/json'
    And request requestBody
    When method POST
    Then status 200
    And print response
    And match response.booking.firstname == "Ceren"
    And match response.booking.lastname == "Kılıç"
    And match response.booking.totalprice == 500
    And match response.booking.depositpaid == false
    And match response.booking.bookingdates.checkin == "2026-01-10"
    And match response.booking.bookingdates.checkout == "2026-01-20"
    And match response.booking.additionalneeds == "wi-fi"