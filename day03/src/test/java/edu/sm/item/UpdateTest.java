package edu.sm.item;

import edu.sm.app.dto.ItemDto;
import edu.sm.app.service.CustService;
import edu.sm.app.service.ItemService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.time.LocalDateTime;

@SpringBootTest
@Slf4j
class UpdateTest {
    @Autowired
    CustService custService;
    @Autowired
    private ItemService itemService;

    @Test
    void contextLoads(){
        ItemDto itemdto = ItemDto.builder()
                .itemId(1)
                .itemName("피카츄")
                .itemPrice(2000L)
                .imgName("전기쥐 포켓몬")
                .updateDate(LocalDateTime.now())
                .build();
        try {
            itemService.modify(itemdto);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
