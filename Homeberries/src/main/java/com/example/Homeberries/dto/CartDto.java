package com.example.Homeberries.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
    public class CartDto {
        private Long id;
        private List<CartItemDto> items;
        private Integer totalAmount;
        private LocalDateTime updatedAt;
    }
