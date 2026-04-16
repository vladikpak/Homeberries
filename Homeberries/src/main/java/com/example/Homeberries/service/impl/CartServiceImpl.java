package com.example.Homeberries.service.impl;

import com.example.Homeberries.Repository.CartItemRepository;
import com.example.Homeberries.Repository.CartRepository;
import com.example.Homeberries.Repository.ProductRepository;
import com.example.Homeberries.Repository.UserRepository;
import com.example.Homeberries.dto.CartDto;
import com.example.Homeberries.dto.CartItemDto;
import com.example.Homeberries.model.Cart;
import com.example.Homeberries.model.CartItem;
import com.example.Homeberries.model.Product;
import com.example.Homeberries.model.User;
import com.example.Homeberries.service.CartService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class CartServiceImpl implements CartService {
    private final CartRepository cartRepository;
    private final CartItemRepository cartItemRepository;
    private final ProductRepository productRepository;
    private final UserRepository userRepository;

    private Cart getCart(Long userId) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));

        return cartRepository.findByUser(user)
                .orElseThrow(() -> new RuntimeException("Cart not found"));
    }

    @Override
    public CartDto getCartByUser(Long userId) {
        Cart cart = getCart(userId);
        return convertToDto(cart);
    }

    @Override
    public CartDto addToCart(Long userId, Long productId, int quantity) {
        Cart cart = getCart(userId);

        Product product = productRepository.findById(productId)
                .orElseThrow(() -> new RuntimeException("Product not found"));

        CartItem existingItem = cartItemRepository.findByCartAndProduct(cart, product)
                .orElse(null);

        if (existingItem != null) {
            existingItem.setQuantity(existingItem.getQuantity() + quantity);
            cartItemRepository.save(existingItem);
        } else {
            CartItem newItem = CartItem.builder()
                    .cart(cart)
                    .product(product)
                    .quantity(quantity)
                    .build();
            cartItemRepository.save(newItem);
            cart.getItems().add(newItem);
        }

        cart.setUpdatedAt(LocalDateTime.now());
        Cart saved = cartRepository.save(cart);
        return convertToDto(saved);
    }

    @Override
    public CartDto removeFromCart(Long userId, Long productId) {
        Cart cart = getCart(userId);
        cartItemRepository.findByCartAndProduct(cart, productRepository.getReferenceById(productId))
                .ifPresent(cartItemRepository::delete);

        cart.setUpdatedAt(LocalDateTime.now());
        return convertToDto(cartRepository.save(cart));
    }

    @Override
    public CartDto updateQuantity(Long userId, Long productId, int quantity) {
        Cart cart = getCart(userId);
        CartItem item = cartItemRepository.findByCartAndProduct(cart, productRepository.getReferenceById(productId))
                .orElseThrow(() -> new RuntimeException("Item not found"));

        if (quantity <= 0) {
            cartItemRepository.delete(item);
        } else {
            item.setQuantity(quantity);
            cartItemRepository.save(item);
        }

        cart.setUpdatedAt(LocalDateTime.now());
        return convertToDto(cartRepository.save(cart));
    }

    @Override
    public Integer calculateTotal(CartDto cartDto) {
        return cartDto.getItems().stream()
                .map(CartItemDto::getSubtotal)
                .reduce(0, Integer::sum);
    }

    @Override
    public void clearCart(Long user) {
        Cart cart = getCart(user);

        cartItemRepository.deleteByCart(cart);
        cart.getItems().clear();

        cart.setUpdatedAt(LocalDateTime.now());
        cartRepository.save(cart);
    }


    private CartDto convertToDto(Cart cart) {
        List<CartItemDto> itemDtos = cart.getItems().stream()
                .map(item -> CartItemDto.builder()
                        .id(item.getId())
                        .productId(item.getProduct().getId())
                        .productName(item.getProduct().getName())
                        .productPrice(item.getProduct().getPrice())
                        .quantity(item.getQuantity())
                        .subtotal(item.getProduct().getPrice() * item.getQuantity())
                        .build())
                .collect(Collectors.toList());

        Integer total = itemDtos.stream()
                .map(CartItemDto::getSubtotal)
                .reduce(0, Integer::sum);

        return CartDto.builder()
                .id(cart.getId())
                .items(itemDtos)
                .totalAmount(total)
                .updatedAt(cart.getUpdatedAt())
                .build();
    }
}
