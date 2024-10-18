package edu.sm.cart;


import edu.sm.app.dto.CartDto;
import edu.sm.app.service.CartService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.time.LocalDateTime;

@SpringBootTest
@Slf4j
public class InsertTest {
    @Autowired
    CartService cartService;

    @Test
    void insertTest() {
        CartDto cartDto = CartDto.builder()
                .userId("id01")
                .itemId(1)
                .count(2)
                .regDate(LocalDateTime.now())
                .build();

        try {
            cartService.add(cartDto);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
