package user;


import com.intuit.karate.junit5.Karate;

public class RetrieveAllUsersTest {

    @Karate.Test
    Karate retrieveAllUsersTest() {
        return Karate.run("retrieveAllUsers").relativeTo(getClass());
    }
}