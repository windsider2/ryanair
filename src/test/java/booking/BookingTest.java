package booking;


import com.intuit.karate.junit5.Karate;

public class BookingTest {
    @Karate.Test
    Karate bookingTest() {
        return Karate.run("booking").relativeTo(getClass());
    }
}
