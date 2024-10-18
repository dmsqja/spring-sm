package edu.sm.cart;


import edu.sm.app.dto.CartDto;
import edu.sm.app.service.CartService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
public class SelectOneTest {
    @Autowired
    CartService cartService;

    @Test
    void selectOneTest() {
        int cartId = 1;

        try {
            CartDto result = cartService.get(cartId);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
