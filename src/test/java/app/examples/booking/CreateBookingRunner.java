package examples.booking;


import com.intuit.karate.junit5.Karate;

public class CreateBookingRunner {
    @Karate.Test
    Karate bookingTest() {
        return Karate.run("create-booking").relativeTo(getClass());
    }
}
