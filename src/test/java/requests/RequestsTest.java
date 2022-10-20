package requests;

import com.intuit.karate.junit5.Karate;


class RequestsTest {

    @Karate.Test
    Karate testAll() {
        return Karate.run().relativeTo(getClass());
    }
    
}
