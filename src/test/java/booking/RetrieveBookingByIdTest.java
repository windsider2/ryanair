package booking;


import com.intuit.karate.junit5.Karate;

public class RetrieveBookingByIdTest {
    @Karate.Test
    Karate bookingReturnTest() {
        return Karate.run("retrieveBookingById").relativeTo(getClass());
    }
}