package util;

import java.time.LocalDate;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;

public class DateUtils {

    public static String getCurrentDate() {
        return LocalDate.now().format( getFormatter());
    }

    public static String getFutureDate(long numberOfMonths) {
        return LocalDate.now().plusMonths(numberOfMonths).format(getFormatter());
    }

    public static String getPastDate(long numberOfMonths) {
        return LocalDate.now().minusMonths(numberOfMonths).format(getFormatter());
    }

    public static String getCurrentDateTime() {
        return ZonedDateTime.now(ZoneId.of("Z")).truncatedTo(ChronoUnit.MINUTES)
                .toString();
    }

    private static DateTimeFormatter getFormatter() {
        return DateTimeFormatter.ofPattern("yyyy-MM-dd");
    }
}
