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
 
