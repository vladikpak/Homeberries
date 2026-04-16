package com.example.Homeberries.model;

import jakarta.persistence.*;
import lombok.*;

import java.util.List;

@Entity
@Table(name = "categories")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Category {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "name", nullable = false, unique = true)
    private String name;
    @Column(name = "description")
    private String description;
    @Column(name = "icon")
    private String icon;

    @OneToMany(mappedBy = "category")
    @ToString.Exclude
    private List<Product> products;  // Товары в категории  (Category - 1 шт. (Обувь) - содержит -  Product - МНОГО заказов из обуви)
}
