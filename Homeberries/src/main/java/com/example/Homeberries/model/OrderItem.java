package com.example.Homeberries.model;

@Entity
@Table(name = "order_items")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class OrderItem {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "order_id")
    private Order order;            // Какой заказ

    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product product;        // Какой товар

    private Integer quantity;       // Сколько штук
    private BigDecimal price;       // Цена на момент заказа
}
