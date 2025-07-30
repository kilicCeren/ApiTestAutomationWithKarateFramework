Feature: FA01 Kullanici Get request sonucu donen response test eder


  @faApi
  Scenario: TC01 Get request'e donen response'in beklenilen ozelliklerde olmasi gerekir

    Given url 'https://fakerapi.it/api/v1/persons'
    # And path yerine param kullandık çünkü path sadece endpoint için, Query parametlerle param kullanılır.
    And param _quantity = 1
    When method GET
    Then status 200
    #And print response //dönen response'u yazdırmak için kullanılır.
    And match responseStatus == 200
    And assert responseHeaders['Content-Type'][0] == 'application/json'
    And assert response.data[0].firstname.length > 0
    And assert response.data[0].lastname.length > 0



