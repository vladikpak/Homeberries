package com.example.Homeberries.model;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "products")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name = "name", nullable = false)
    private String name;
    @Column(name = "description")
    private String description;
    @Column(name = "price", nullable = false)
    private Integer price;
    @Column(name = "stock")
    private Integer stock;
    @Column(name = "imageUrl")
    private String imageUrl;

    @ManyToOne
    @JoinColumn(name = "category_id")
    @ToString.Exclude
    private Category category;     // Категория (Product - МНОГО, Category - 1 шт. (пример: Обувь)). Много товаров (ОБУВИ) в одной Категории (Обувь).

    @Column(name = "created_at")
    private LocalDateTime createdAt;
}
