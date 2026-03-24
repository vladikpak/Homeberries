package com.example.Homeberries.model;

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

    private String email;
    private String password;
    private String name;
    private String phone;
    private String role;  // USER или ADMIN
    private Integer balance;

    @OneToOne(mappedBy = "user", cascade = CascadeType.ALL)
    private Cart cart;    // Корзина пользователя

    @OneToMany(mappedBy = "user")
    private List<Order> orders;  // Заказы пользователя

    private LocalDateTime createdAt;
}
