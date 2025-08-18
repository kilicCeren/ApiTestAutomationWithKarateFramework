Feature: JPH07 Kullanici  PATCH ile guncelleme yapar ve dogrular

  Background:
    * def baseUrl = 'https://jsonplaceholder.typicode.com/posts'

  Scenario: TC07 PATCH sonrasi guncellemeyi dogrula
    Given url baseUrl
    And path 71
    And request
    """
    {
      "title": "Amelie",
      "body": "Kilic"
    }
    """
    When method PATCH
    Then status 200

    And assert response.title == 'Amelie'
    And assert response.body == 'Kilic'
    And assert response.userId == 8
