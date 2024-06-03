package examples.booking;


import com.intuit.karate.junit5.Karate;

public class BookingHeadersRunner {
    @Karate.Test
    Karate bookingHeadersTest() {
        return Karate.run("booking-headers").relativeTo(getClass());
    }
}