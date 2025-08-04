Feature: FA04 Kullanici Get request sonucu donen response test eder


  Scenario: TC04 Get request'e donen response'in beklenilen ozelliklerde olmasi gerekir

    Given url 'https://fakerapi.it/api/v1/products'
    And param _quantity = 1
    When method GET
    Then status 200
    And print response
    And match  responseStatus == 200
    And assert responseHeaders['Content-Type'][0] == 'application/json'
    And assert response.data[0].name.length > 0
    And assert response.data[0].price > 0
    And assert response.data[0].categories.length > 0

