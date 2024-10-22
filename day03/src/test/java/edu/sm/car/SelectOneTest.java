package edu.sm.car;

import edu.sm.app.service.CarService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
class SelectOneTest {
    @Autowired
    CarService carService;

    @Test
    void contextLoads() {
        int carId = 12;
        try {
            carService.get(carId);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}