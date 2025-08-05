package restfulBooker;

import com.intuit.karate.junit5.Karate;

public class RunnerRB {

    @Karate.Test
    Karate runApiTests() {
        return Karate.run()
                .tags("@rbApi")                   // tag'e göre filtreleme
                .relativeTo(getClass());         // bu sınıfın klasöründen başlatır
    }

    /*
    Karate.run("classpath:features/jsonPlaceHolder") // .feature dosyasının tam yolu
      .tags("@api")
      .relativeTo(getClass());

     */
}