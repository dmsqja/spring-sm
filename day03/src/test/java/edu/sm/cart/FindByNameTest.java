package edu.sm.cart;


import edu.sm.app.dto.CartDto;
import edu.sm.app.service.CartService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
@Slf4j
public class FindByNameTest {
    @Autowired
    CartService cartService;

    @Test
    void findByNameTest() {
        String name = "item";

        try {
            List<CartDto> results = cartService.findByName(name);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
