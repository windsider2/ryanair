package booking;


import com.intuit.karate.junit5.Karate;

public class BookingHeadersTest {
    @Karate.Test
    Karate bookingTest() {
        return Karate.run("bookingHeaders").relativeTo(getClass());
    }
}