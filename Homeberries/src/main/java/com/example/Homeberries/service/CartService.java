package com.example.Homeberries.service;

import com.example.Homeberries.dto.CartDto;
import com.example.Homeberries.model.Cart;
import com.example.Homeberries.model.User;
import org.springframework.transaction.annotation.Transactional;

public interface CartService {
    CartDto removeFromCart(Long userId, Long productId);

    CartDto updateQuantity(Long userId, Long productId, int quantity);

    Integer calculateTotal(CartDto cart);

    @Transactional
    void clearCart(Long user);

    CartDto getCartByUser(Long userId);

    CartDto addToCart(Long userId, Long productId, int quantity);
}
