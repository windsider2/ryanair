package user;


import com.intuit.karate.junit5.Karate;

public class CreateUserTest {

    @Karate.Test
    Karate userCreateTest() {
        return Karate.run("createUser").relativeTo(getClass());
    }
    }
