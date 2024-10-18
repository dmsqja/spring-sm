package edu.sm.cart;


import edu.sm.app.service.CartService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
public class DeleteTest {
    @Autowired
    CartService cartService;

    @Test
    void deleteTest() {
        int cartId = 1;

        try {
            cartService.del(cartId);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
