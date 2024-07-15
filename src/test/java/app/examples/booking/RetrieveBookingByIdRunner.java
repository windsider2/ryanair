package examples.booking;


import com.intuit.karate.junit5.Karate;

public class RetrieveBookingByIdRunner {
    @Karate.Test
    Karate bookingReturnTest() {
        return Karate.run("retrieve-booking-by-id.feature").relativeTo(getClass());
    }
}