package examples.user;


import com.intuit.karate.junit5.Karate;

public class RetrieveAllUsersRunner {

    @Karate.Test
    Karate retrieveAllUsersTest() {
        return Karate.run("retrieve-all-users").relativeTo(getClass());
    }
}