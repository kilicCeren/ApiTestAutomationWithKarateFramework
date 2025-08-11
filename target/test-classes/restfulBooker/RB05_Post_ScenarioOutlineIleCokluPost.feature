Feature: Kullanici farkli verilerle coklu POST request gonderir

  Scenario Outline: TC01 Kullanici, degisik rezervasyon bilgileriyle art arda POST istegi gondererek yeni rezervasyonlar olusturabilmeli
    Given url 'https://restful-booker.herokuapp.com/booking'
    And header Content-Type = 'application/json'
    And header Accept = 'application/json'
    And request { firstname: '<firstname>', lastname: '<lastname>', totalprice: '<totalprice>', depositpaid: '<depositpaid>', bookingdates: {checkin: '<checkin>',checkout: '<checkout>'},additionalneeds: '<additionalneeds>'}
    When method post
    Then status 200

    Examples:
      | firstname | lastname | totalprice | depositpaid | checkin    | checkout   | additionalneeds |
      | Amelie    | Poulain  | 500        | false       | 2026-01-10 | 2026-01-20 | wi-fi           |
      | Ceren     | Kilic    | 750        | true        | 2026-02-01 | 2026-02-10 | breakfast       |

