package com.example.Homeberries.dto;

public class CartDto {
    @Data
    @Builder
    @NoArgsConstructor
    @AllArgsConstructor
    public class CartDto {
        private List<CartItemDto> items;
        private BigDecimal totalAmount;
        private Integer totalItems;
    }
}
