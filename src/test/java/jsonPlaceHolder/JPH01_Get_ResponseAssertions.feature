Feature: JPH01 Kullanici Get request sonucu donen response test eder



  Scenario: TC01 Get request'e donen response'in beklenilen ozelliklerde olmasi gerekir
    Given url baseUrl
    And path 'posts',44
    When method GET
    Then status 200
    And match responseStatus == 200
    And assert responseTime < 2000
    And assert responseHeaders['Content-Type'][0] == 'application/json; charset=utf-8'
    And assert response.userId == 5
    And assert response.id == 44