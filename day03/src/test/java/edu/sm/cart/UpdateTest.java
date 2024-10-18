package edu.sm.cart;


import edu.sm.app.dto.CartDto;
import edu.sm.app.service.CartService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
public class UpdateTest {
    @Autowired
    CartService cartService;

    @Test
    void updateTest() {
        CartDto cartDto = CartDto.builder()
                .cartId(1)
                .count(3)
                .build();

        try {
            cartService.modify(cartDto);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
