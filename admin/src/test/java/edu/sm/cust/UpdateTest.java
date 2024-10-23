package edu.sm.cust;

import edu.sm.app.dto.CustDto;
import edu.sm.app.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
class UpdateTest {
    @Autowired
    CustService custService;

    @Test
    void contextLoads(){
        CustDto custdto = CustDto.builder().custId("id66").custPwd("pwd66 ").custName("이말자").build();
        try {
            custService.modify(custdto);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
