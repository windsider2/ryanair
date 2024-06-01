package user;


import com.intuit.karate.junit5.Karate;

public class UserCreateTest {

    @Karate.Test
    Karate userCreateTest() {
        return Karate.run("userCreate").relativeTo(getClass());
    }
    }
