package booking;


import com.intuit.karate.junit5.Karate;

public class RetrieveAllBookingsTest {
    @Karate.Test
    Karate bookingReturnTest() {
        return Karate.run("retrieveAllBookings").relativeTo(getClass());
    }
}