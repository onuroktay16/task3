package requests.features;


import com.intuit.karate.junit5.Karate;

class UsersRunner {

    @Karate.Test
    Karate features() {
        return Karate.run("features").relativeTo(getClass());
    }    

}
