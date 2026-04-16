package com.example.Homeberries.service;

import com.example.Homeberries.dto.ProductDto;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface ProductService {

    ProductDto getProductById(Long id);

    Page<ProductDto> searchProducts(String name, Long id, Pageable pageable);

    ProductDto createProduct(ProductDto dto, MultipartFile image);
}
