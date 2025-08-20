Feature: Kullanici POST sonrasi PATCH ile kismi guncelleme yapar ve dogrular

  Background:
    * def base = 'https://restful-booker.herokuapp.com'
    * def bookingPath = 'booking'
    * def authHeader = 'Basic YWRtaW46cGFzc3dvcmQxMjM='

  Scenario: TC01 PATCH sonrasi guncellemeyi dogrula

    # 1) Yeni booking oluştur
    * def requestBody = read("rb_td_request.json")
    Given url base
    And path bookingPath
    And header Content-Type = 'application/json'
    And header Accept = 'application/json'
    And request requestBody
    When method POST
    Then status 200
    * def bookingId = response.bookingid
    And print 'Oluşturulan bookingId:', bookingId

    # 2) Auth token al
    Given url base
    And path 'auth'
    And header Content-Type = 'application/json'
    And header Accept = 'application/json'
    And request { username: 'admin', password: 'password123' }
    When method POST
    Then status 200
    * def token = response.token
    And print 'Token:', token

    # 3) PATCH ile kısmi güncelleme yap
    Given url base
    And path bookingPath, bookingId
    And header Content-Type = 'application/json'
    And header Accept = 'application/json'
    And header Cookie = 'token=' + token
    And request
    """
    {
      "firstname": "Amelie",
      "lastname": "Poulain"
    }
    """
    When method PATCH
    Then status 200
    * def patchResponse = response
    And print 'PATCH response:', patchResponse

    # 4) PATCH dönüşünü doğrula
    And assert patchResponse.firstname == "Amelie"
    And assert patchResponse.lastname == "Poulain"

    # 5) GET ile de kontrol et
    Given url base
    And path bookingPath, bookingId
    And header Accept = 'application/json'
    When method GET
    Then status 200
    And match response.firstname == "Amelie"
    And match response.lastname == "Poulain"
