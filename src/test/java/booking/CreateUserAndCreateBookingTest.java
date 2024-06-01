package booking;


import com.intuit.karate.junit5.Karate;

public class CreateUserAndCreateBookingTest {
    @Karate.Test
    Karate bookingTest() {
        return Karate.run("createUserAndCreateBooking").relativeTo(getClass());
    }
}
