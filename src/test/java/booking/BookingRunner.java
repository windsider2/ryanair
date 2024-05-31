package booking;


import com.intuit.karate.junit5.Karate;

public class BookingRunner {
    @Karate.Test
    Karate bookingTest() {
        return Karate.run("booking").relativeTo(getClass());
    }
}
