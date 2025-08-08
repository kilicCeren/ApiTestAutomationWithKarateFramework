Feature: Kullanici Post request sonucu donen response test eder


  Background:

    * def requestBody = read("rb_td_request.json")
    
  Scenario: TC01 Post request'e donen response'in beklenilen ozelliklerde olmasi gerekir

    Given url 'https://restful-booker.herokuapp.com/booking'
    And header Content-Type = 'application/json'
    And header Accept = 'application/json'
    And request requestBody
    When method POST
    Then status 200
    #And print response
    # match kullanarak  body tek bir seferde kontrol ettirebiliriz
    And match response.booking == requestBody
    #assert ile body'de bulunan her hangi birini kontrol ettirebiliriz.
    And assert response.booking.firstname == requestBody.firstname
    And assert response.booking.lastname == requestBody.lastname
    And assert response.booking.totalprice == requestBody.totalprice
    And assert response.booking.depositpaid == requestBody.depositpaid
    And assert response.booking.bookingdates.checkin == requestBody.bookingdates.checkin
    And assert response.booking.bookingdates.checkout == requestBody.bookingdates.checkout
    And assert response.booking.additionalneeds == requestBody.additionalneeds

