package com.example.Homeberries.dto;

import com.example.Homeberries.model.Category;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ProductDto {
    private Long id;
    private String name;
    private String description;
    private Integer price;
    private Integer stock;
    private String imageUrl;
    private Category category;
    private Long categoryId;
    private String categoryName;
}
