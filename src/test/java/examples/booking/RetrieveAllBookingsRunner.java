package examples.booking;


import com.intuit.karate.junit5.Karate;

public class RetrieveAllBookingsRunner {
    @Karate.Test
    Karate bookingReturnTest() {
        return Karate.run("retrieve-all-bookings").relativeTo(getClass());
    }
}