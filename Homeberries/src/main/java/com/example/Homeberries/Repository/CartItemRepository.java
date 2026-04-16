package com.example.Homeberries.Repository;

import com.example.Homeberries.model.Cart;
import com.example.Homeberries.model.CartItem;
import com.example.Homeberries.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface CartItemRepository extends JpaRepository<CartItem, Long> {
    // Найти товар в корзине (по корзине и товару)
    Optional<CartItem> findByCartAndProduct(Cart cart, Product product);

    List<CartItem> findByCart(Cart cart);

    void deleteByCart(Cart cart);
}