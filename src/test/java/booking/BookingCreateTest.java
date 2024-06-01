package booking;


import com.intuit.karate.junit5.Karate;

public class BookingCreateTest {
    @Karate.Test
    Karate bookingTest() {
        return Karate.run("bookingCreate").relativeTo(getClass());
    }
}
