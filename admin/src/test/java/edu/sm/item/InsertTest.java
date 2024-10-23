package edu.sm.item;

import edu.sm.app.dto.ItemDto;
import edu.sm.app.service.ItemService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.time.LocalDateTime;

@SpringBootTest
@Slf4j
class InsertTest {

    @Autowired
    ItemService itemService;

    @Test
    void contextLoads(){
        ItemDto itemdto = ItemDto.builder()
                .itemName("아이폰")
                .itemPrice(400000)
                .imgName("아이폰12미니져")
                .regDate(LocalDateTime.now())
                .updateDate(LocalDateTime.now())
                .build();
        try {
            itemService.add(itemdto);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
