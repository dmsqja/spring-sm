package edu.sm.car;


import edu.sm.app.dto.CarDto;
import edu.sm.app.service.CarService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.time.LocalDateTime;

@SpringBootTest
@Slf4j
public class InsertTest {
    @Autowired
    CarService carService;

    @Test
    void insertTest() {
        CarDto carDto = CarDto.builder()
                .carName("스팅어")
                .carPrice(35000000)
                .carColor("빨강")
                .carType("세단")
                .carImg("stinger.jpg")
                .productionDate(LocalDateTime.parse("2024-10-22T09:24:30"))
                .build();
        try {
            carService.add(carDto);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
