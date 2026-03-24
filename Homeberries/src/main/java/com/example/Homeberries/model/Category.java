package com.example.Homeberries.model;

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

    private String name;           // "Электроника"
    private String description;    // "Телефоны, ноутбуки"
    private String icon;           // "fas fa-mobile-alt"

    @OneToMany(mappedBy = "category")
    private List<Product> products;  // Товары в категории
}
