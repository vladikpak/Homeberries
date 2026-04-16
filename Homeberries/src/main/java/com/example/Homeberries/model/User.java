package com.example.Homeberries.model;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;

import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "users")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "email", nullable = false, unique = true)
    private String email;
    @Column(name = "password", nullable = false)
    private String password;
    @Column(name = "name")
    private String name;
    @Column(name = "phone")
    private String phone;
    @Column(name = "role")
    private String role;
    @Column(name = "preferred_language")
    private String preferredLanguage;

    @OneToOne(mappedBy = "user", cascade = CascadeType.ALL)
    @ToString.Exclude
    private Cart cart;    // Корзина пользователя (User - 1, Cart - 1). У одного пользователя одна корзина

    @OneToMany(mappedBy = "user")
    @ToString.Exclude
    private List<Order> orders;  // Заказы пользователя (User - 1, Order - 1 или МНОГО заказов). У одного пользователя много заказов

//    @CreationTimestamp
    @Column(name = "created_at")
    private LocalDateTime createdAt;
}
