package util;

import com.github.javafaker.Faker;
import com.github.javafaker.service.FakeValuesService;
import com.github.javafaker.service.RandomService;

import java.util.Locale;
import java.util.Random;

public class TestData {
    public static String getRandomEmail() {
        FakeValuesService fakeValuesService = new FakeValuesService(
                new Locale("en-GB"), new RandomService());
        return fakeValuesService.bothify("????##@gmail.com");
    }

    public static String getRandomFirstName() {
        return new Faker(new Random(24)).name().firstName();
    }

    public static String getRandomLastName() {
        return new Faker(new Random(24)).name().lastName();
    }
}
