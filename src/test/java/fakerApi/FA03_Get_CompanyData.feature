Feature: FA03 Kullanici Get request sonucu donen response test eder


  Scenario: TC03 Get request'e donen response'in beklenilen ozelliklerde olmasi gerekir

    Given url 'https://fakerapi.it/api/v1/companies'
    And param _quantity = 1
    When method GET
    Then status 200
    And match responseStatus ==200
    And assert responseHeaders['Content-Type'][0] == 'application/json'
    And assert  response.data[0].name.length > 0
    And match response.data[0].email contains '@'
    # sadece rakamların varlığını kontrol etmek '#regex ^[0-9]+$' bunu kullanırdık ama telefon numaralarında alan kodu
    # ("phone": "+17258458053") + ve - kullanıldığı için bunların  bulunnmasını ignore etmeliyiz
    And match response.data[0].phone == '#regex ^[0-9+\\-]+$'
