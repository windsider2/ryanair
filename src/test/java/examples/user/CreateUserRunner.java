package examples.user;


import com.intuit.karate.junit5.Karate;

public class CreateUserRunner {

    @Karate.Test
    Karate userCreateTest() {
        return Karate.run("create-user").relativeTo(getClass());
    }
    }
