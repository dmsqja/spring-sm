package edu.sm.car;

import edu.sm.app.dto.CarDto;
import edu.sm.app.dto.CustDto;
import edu.sm.app.service.CarService;
import edu.sm.app.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.time.LocalDateTime;

@SpringBootTest
@Slf4j
class UpdateTest {
    @Autowired
    CarService carService;

    @Test
    void contextLoads(){
        CarDto carDto = CarDto
                .builder()
                .carId(12)
                .carName("스팅어")
                .carPrice(40000000)
                .carColor("빨강")
                .carType("세단")
                .carImg("stinger.jpg")
                .productionDate(LocalDateTime.parse("2024-10-22T09:39:45"))
                .build();
        try {
            carService.modify(carDto);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
