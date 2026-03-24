package com.example.Homeberries.model;

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
    private String name;           // Название
    private String description;    // Описание
    private Integer price;      // Цена
    private Integer stock;         // Количество на складе
    private String imageUrl;
    // Картинка
    @ManyToOne
    @JoinColumn(name = "category_id")
    private Category category;     // Категория
    private LocalDateTime createdAt;
}
