package com.example.Homeberries.model;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "carts")
@Setter
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Cart {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne
    @JoinColumn(name = "user_id", nullable = false, unique = true)
    @ToString.Exclude
    private User user;              // Владелец корзины | (Cart - 1, User - 1). | Корзина принадлежит пользователю

    @OneToMany(mappedBy = "cart", cascade = CascadeType.ALL)
    @ToString.Exclude
    private List<CartItem> items;   // Товары в корзине | (Cart - 1, CartItem - 1). | В корзине много товаров (из обуви)

    @Column(name = "updated_at")
    private LocalDateTime updatedAt;
}
