package booking;


import com.intuit.karate.junit5.Karate;

public class CreateBookingTest {
    @Karate.Test
    Karate bookingTest() {
        return Karate.run("createBooking").relativeTo(getClass());
    }
}
