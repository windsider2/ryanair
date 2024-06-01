package user;


import com.intuit.karate.junit5.Karate;

public class RetrieveUserByIdTest {

    @Karate.Test
    Karate userCreateTest() {
        return Karate.run("retrieveUserById").relativeTo(getClass());
    }
}