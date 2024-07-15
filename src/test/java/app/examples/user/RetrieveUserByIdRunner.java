package examples.user;


import com.intuit.karate.junit5.Karate;

public class RetrieveUserByIdRunner {

    @Karate.Test
    Karate userCreateTest() {
        return Karate.run("retrieve-user-by-id").relativeTo(getClass());
    }
}