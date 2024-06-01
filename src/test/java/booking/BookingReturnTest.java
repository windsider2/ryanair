package booking;


import com.intuit.karate.junit5.Karate;

public class BookingReturnTest {
    @Karate.Test
    Karate bookingReturnTest() {
        return Karate.run("bookingReturn").relativeTo(getClass());
    }
}