package com.example.Homeberries.model;

@Entity
@Table(name = "orders")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;              // Кто заказал

    @OneToMany(mappedBy = "order", cascade = CascadeType.ALL)
    private List<OrderItem> items;  // Что заказал

    private BigDecimal totalAmount; // Общая сумма
    private String status;          // NEW, PAID, DELIVERED

    private LocalDateTime createdAt;
}
