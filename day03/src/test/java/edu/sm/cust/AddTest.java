package edu.sm.cust;

import edu.sm.app.dto.CustDto;
import edu.sm.app.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
@Slf4j
class AddTest {
    @Autowired
    CustService custService;

    @Test
    void contextLoads(){
        CustDto custdto = CustDto.builder()
                .id("123")
                .pwd("pass123")
                .name("김수한무")
                .build();
        try {
            CustDto addCust = custService.add(custdto);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}