Feature: Kullanıci farkli verilerle coklu POST request gonderir

  Scenario Outline: Coklu POST request sonrasi response dogrulama
    * def requestBody =
    """
    {
      "firstname": "<firstname>",
      "lastname": "<lastname>",
      "totalprice": <totalprice>,
      "depositpaid": <depositpaid>,
      "bookingdates": {
        "checkin": "<checkin>",
        "checkout": "<checkout>"
      },
      "additionalneeds": "<additionalneeds>"
    }
    """

    Given url 'https://restful-booker.herokuapp.com/booking'
    And header Content-Type = 'application/json'
    And header Accept = 'application/json'
    And request requestBody
    When method POST
    Then status 200

    * def savedResponse = response

    And match savedResponse.booking.firstname == "<firstname>"
    And match savedResponse.booking.lastname == "<lastname>"
    And match savedResponse.booking.totalprice == <totalprice>
    And match savedResponse.booking.depositpaid == <depositpaid>
    And match savedResponse.booking.bookingdates.checkin == "<checkin>"
    And match savedResponse.booking.bookingdates.checkout == "<checkout>"
    And match savedResponse.booking.additionalneeds == "<additionalneeds>"

    Examples:
      | firstname | lastname | totalprice | depositpaid | checkin    | checkout   | additionalneeds |
      | Ceren     | Kilic    | 150        | true        | 2026-10-01 | 2024-10-05 | Kahvalti        |
      | Amelie    | Poulain  | 200        | false       | 2026-11-10 | 2024-11-15 | Aksam yemegi    |
