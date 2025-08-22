Feature: Kullanici Get request sonucu donen response test eder



  Scenario: TC01 Get request'e donen response'in beklenilen ozelliklerde olmasi gerekir

    Given url 'https://restful-booker.herokuapp.com/'
    And path 'booking',70
    And header Content-Type = 'application/json'
    And header Accept = 'application/json'
    When method GET
    Then status 200
    And print response


