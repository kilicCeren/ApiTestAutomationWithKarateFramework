Feature: JPH03 Kullanici Test datalarini Feature icinde Testten once tanimlayabilmeli

  Background: Test datalarini tanimlama
    * url baseUrl
    * def pathParams = ['posts', 70]
    # Birden fazla path değeri tanımlanacaksa, bunlar list [] içinde yazılmalıdır
    * def requestBody =
    """
    {
    "id": 70,
    "title": "Ceren",
    "body": "Merhaba",
    "userId": 10
    }
    """

    * def expectedResponseBody =
    """
    {
    "id": 70,
    "title": "Ceren",
    "body": "Merhaba",
    "userId": 10
    }
    """


  Scenario: TC03 Background Kullanilabilmeli

    Given url  baseUrl
    And path  pathParams
    When request  requestBody
    And method Put
    Then status 200

    And match header Content-Type == 'application/json; charset=utf-8'
    And match header Connection == 'keep-alive'

    And assert response.id == expectedResponseBody.id
    And assert response.title == expectedResponseBody.title
    And assert response.body == expectedResponseBody.body
    And assert response.userId == expectedResponseBody.userId

  # response ile expectedResponse'in ayni oldugunu test etmek icin tek tek attribute'leri karsilastirmak yerine direkt ikisinin esitligi de test edilebilir
    And match response == expectedResponseBody