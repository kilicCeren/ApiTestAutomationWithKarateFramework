Feature: JPH05 Kullanici  disaridan kullandigi Json objelerinde degisikilik yapabilmeli


  Background:

    * def baseUrl = 'https://jsonplaceholder.typicode.com'
    * def pathParams = ['posts', 70]
    * def requestBody = read("td_request.json")
    * def expectedResponseBody = read("td_expectedResponseBody.json")

  Scenario: TC05 disaridan Json Obje Kullanilabilmeli
    Given url baseUrl
    And path pathParams
      # Request Body Güncelle
    * set requestBody.title = "Karate"
    * set requestBody.body = "Framework"
      # Expected Body Güncelle
    * set expectedResponseBody.title = "Karate"
    * set expectedResponseBody.body = "Framework"
    And request requestBody
    When method PUT
    Then status 200
    And print response
    And match responseHeaders['Content-Type'] ==  ["application/json; charset=utf-8"]
    And match response contains expectedResponseBody
    And assert response.id == expectedResponseBody.id
    And assert response.title == expectedResponseBody.title
    And assert response.body == expectedResponseBody.body
    And assert response.userId == expectedResponseBody.userId