Feature:

  Scenario: TC02 Get request'e donen response'in beklenilen ozelliklerde olmasi gerekir

    Given url 'https://fakerapi.it/api/v1/addresses'
    And param _quantity = 1
    When method GET
    Then status 200
    And match responseStatus == 200
    And assert  responseHeaders['Content-Type'][0] == 'application/json'
    And assert  response.data[0].city.length > 0
    #Test datası olduğu  için country alanı sürekli değişiyor bu yüzden string data içerip içermdiğini kontrol ettim
    And match response.data[0] contains { country: '#string' }


