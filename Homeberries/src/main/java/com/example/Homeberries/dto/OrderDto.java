package com.example.Homeberries.dto;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class OrderDto {
    private Long id;
    private List<OrderItemDto> items;
    private BigDecimal totalAmount;
    private String status;  // "NEW", "PAID"
    private LocalDateTime createdAt;
}
