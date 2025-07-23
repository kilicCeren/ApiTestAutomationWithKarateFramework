package jsonPlaceHolder;

import com.intuit.karate.junit5.Karate;

public class RunnerJPH {

    @Karate.Test
    Karate runApiTests() {
        return Karate.run()
                .tags("@api")                   // tag'e göre filtreleme
                .relativeTo(getClass());         // bu sınıfın klasöründen başlatır
    }

    /*
    Karate.run("classpath:features/jsonPlaceHolder") // .feature dosyasının tam yolu
      .tags("@api")
      .relativeTo(getClass());

     */
}