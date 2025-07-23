function fn() {
  var env = karate.env; // karate.env ile ortam bilgisi alınır
  karate.log('Running in environment:', env);

  // Eğer environment belirtilmemişse, Prod default olsun
  if (!env) {
    env = 'prod';
  }

  var config = {
    env: env
  };

  // Ortam bazlı baseUrl ayarları
  if (env === 'qa') {
    config.baseUrl = 'https://qa.placeholder.com';
  } else if (env === 'dev') {
    config.baseUrl = 'https://dev.placeholder.com';
  } else if (env === 'prod') {
    config.baseUrl = 'https://jsonplaceholder.typicode.com';
  }
  //  Örnek olarak header'lara token eklenecekse
     /*
     var tokenResponse = karate.callSingle('classpath:features/common/getToken.feature');
     config.authToken = tokenResponse.token;
     config.headers = { Authorization: 'Bearer ' + config.authToken };
     */

  // Eğer Ortak header ayarları (isteğe bağlı) yapılmak istenirse

  config.headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  };


    // Yada diğer framework ayarları için bu alanlar düzenlenebilir.
    /*
  Timeout ayarları (testte daha stabil sonuçlar için)
  karate.configure('connectTimeout', 5000);  // 5 saniye
  karate.configure('readTimeout', 10000);    // 10 saniye
    */

  // SSL ve Proxy gibi ayarlar (opsiyonel)
  // karate.configure('ssl', true);
  // karate.configure('proxy', 'http://myproxy:8080');



  return config;
}

