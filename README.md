 Bu repository, **Karate Framework** kullanılarak geliştirilmiş, **REST API test otomasyonu** çalışmalarını içeren bir projedir.  
 Proje, **Behavior Driven Development (BDD)** yaklaşımı ile API testlerini herhangi bir Java "step definition" koduna ihtiyaç duymadan, Karate'nin kendi DSL (Domain Specific Language) yapısı ile gerçekleştirmektedir.
 
 Amaç; API endpoint'lerinin doğruluğunu **hızlı, etkili ve okunabilir** test senaryoları ile teminat altına almaktır.
 
 ---
 
 ## 🎯 Projenin Amacı
 
 - Karate Framework ile RESTful API'leri uçtan uca test etmek  
 - Kod yazımını minimize ederek **Gherkin syntax** üzerinden doğrudan API etkileşimi kurmak  
 - Maven ile bağımlılıkları yönetmek ve CI/CD süreçlerine hazır bir yapı kurmak  
 - API yanıtlarını (JSON/XML) doğal bir şekilde doğrulamak  
 - Test verilerini ve ortamlarını (env) tek bir merkezden yönetmek
 
 ---
 
 ## 🛠️ Kullanılan Teknolojiler ve Araçlar
 
 | Teknoloji | Açıklama |
 |----------|---------|
 | **Java** | Projenin çalışma ortamı |
 | **Karate Framework** | API otomasyonu için ana framework |
 | **Maven** | Proje ve bağımlılık yönetimi |
 | **JUnit 5** | Test koşturucu (Runner) altyapısı |
 | **JavaScript** | `karate-config.js` üzerinden dinamik yapılandırma |
 
 ---
 
 ## 📁 Proje Yapısı
 
 ```text
 ApiTestAutomationWithKarateFramework/
 ├── .gitignore
 ├── pom.xml                   # Maven bağımlılıkları (karate-junit5)
 ├── karate-config.js          # Global konfigürasyon ve ortam değişkenleri
 └── src
     └── test
         └── java
             ├── examples       # Örnek test senaryoları ve Runnerlar
             │   ├── users      # Feature dosyaları ve ilgili testler
             │   └── TestRunner.java # Testleri tetikleyen Java sınıfı
             └── logback-test.xml # Loglama yapılandırması
 ```

---

## :test_tube: Test Yaklaşımı (Karate DSL)
Karate, geleneksel Cucumber'dan farklı olarak adım tanımlamaları (step definitions) gerektirmez. Doğrudan .feature dosyası içinde API çağrıları yapılır.

Örnek Feature Dosyası
```
Feature: Karate User API Test
  Background:
    * url '[https://jsonplaceholder.typicode.com](https://jsonplaceholder.typicode.com)'

  Scenario: Get user details and verify
    Given path '/users/1'
    When method get
    Then status 200
    And match response.name == 'Leanne Graham'
    And match response.address.city == 'Gwenborough'
```
---
    
## :mag: Kapsanan Test Senaryoları
* GET, POST, PUT, DELETE metotları ile API etkileşimi
* JSON gövdesi (body) üzerinde derinlemesine doğrulama (match)
* Query ve Path parametrelerinin dinamik kullanımı
* Header ve Authentication (Token/Auth) yönetimi
* karate-config.js ile farklı ortamlara (dev/test/prod) kolay geçiş
* Karmaşık JSON yapılarını tek satırda doğrulama

---

## :gear: karate-config.js
Bu dosya, testlerin hangi URL'e gideceğini ve hangi global değişkenleri kullanacağını belirler. Örnek içeriği:

```

function fn() {
  var config = {
    baseUrl: '[https://api.example.com](https://api.example.com)',
    myVarName: 'someValue'
  };
  return config;
}
```
