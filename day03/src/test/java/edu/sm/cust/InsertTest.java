package edu.sm.cust;

import edu.sm.app.dto.CustDto;
import edu.sm.app.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
class InsertTest {
    @Autowired
    CustService custService;

    @Test
    void contextLoads(){
        CustDto custdto = CustDto.builder().id("id55").pwd("pwd55 ").name("이말자").build();
        try {
            custService.add(custdto);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
