package booking;


import com.intuit.karate.junit5.Karate;

public class CreateBookingAndRetrieveBookingByIdTest {
    @Karate.Test
    Karate bookingReturnTest() {
        return Karate.run("createBookingAndRetrieveBookingById").relativeTo(getClass());
    }
}