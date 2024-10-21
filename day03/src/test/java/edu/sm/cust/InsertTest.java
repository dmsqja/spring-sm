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
        CustDto custdto = CustDto.builder().custId("id02").custPwd("pwd02").custName("박채연").build();
        try {
            custService.add(custdto);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
