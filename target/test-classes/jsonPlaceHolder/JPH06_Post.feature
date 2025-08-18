Feature: JPH06 Kullanici POST request sonucu donen response test eder

  Background:

    * def baseUrl = 'https://jsonplaceholder.typicode.com'
    * def pathParams = '/posts'
    * def requestBody = read ("td_request.json")
    * def expectedResponseBody = read ("td_expectedResponseBody.json")

  Scenario: TC06 POST request'e donen response'in beklenilen ozelliklerde olmasi gerekir
    Given url  baseUrl
    And path  pathParams
    When request  requestBody
    When method POST
    Then status 201
    And print response
    And assert responseHeaders['Content-Type'][0] == 'application/json; charset=utf-8'
    And assert responseHeaders['Connection'][0] == 'keep-alive'
    And assert response.title == 'Ceren'
    And assert response.body == 'Merhaba'
    And assert response.userId == 10
    And print 'Post sonrasi id:',response.id


