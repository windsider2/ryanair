package booking;


import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class BookingTest {
    @Test
    void bookingTest() {
        Results results = Runner.path("classpath:booking/booking.feature")
                .parallel(1);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
    }
