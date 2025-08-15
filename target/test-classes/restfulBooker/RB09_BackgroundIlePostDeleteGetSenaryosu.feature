Feature: Booking kaydi olusturma silme ve dogrulama kullanici once yeni bir rezervasyon olusturur sonra bu rezervasyonu siler ve silindigini GET istegi ile dogrular.

  Background: Base URL,request body ve auth bilgilerinin tanimlanmasi
    * def requestBody = read("rb_td_request.json")
    * def baseUrl = 'https://restful-booker.herokuapp.com'
    * def authCookie = 'token=abc123'
    * def basicAuth = 'Basic YWRtaW46cGFzc3dvcmQxMjM='

  Scenario: Yeni booking olustur  Delete ile sil  GET ile dogrula
    # 1. Booking oluştur
    Given url baseUrl + '/booking'
    And header Content-Type = 'application/json'
    And header Accept = 'application/json'
    And request requestBody
    When method POST
    Then status 200
    * def bookingId = response.bookingid
    And print 'Oluşturulan Booking ID:', bookingId

    # 2. Booking sil
    Given url baseUrl + '/booking'
    And path bookingId
    And header Cookie = authCookie
    And header Authorization = basicAuth
    When method DELETE
    Then status 201
    And print 'Silme cevabı:', response

    # 3. Silinen booking'i doğrula
    Given url baseUrl + '/booking'
    And path bookingId
    When method GET
    Then status 404
    And print 'GET sonrası cevap:', response

