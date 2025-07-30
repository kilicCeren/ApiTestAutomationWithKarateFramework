package fakerApi;

import com.intuit.karate.junit5.Karate;

public class RunnerFA {

    @Karate.Test
    Karate faRunApiTests() {
        return Karate.run()
                .tags("@faApi")                   // tag'e göre filtreleme
                .relativeTo(getClass());         // bu sınıfın klasöründen başlatır
    }

}