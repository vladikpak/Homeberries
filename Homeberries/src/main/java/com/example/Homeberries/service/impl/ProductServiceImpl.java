package com.example.Homeberries.service.impl;

import com.example.Homeberries.Repository.CategoryRepository;
import com.example.Homeberries.Repository.ProductRepository;

import com.example.Homeberries.dto.ProductDto;
import com.example.Homeberries.model.Category;
import com.example.Homeberries.model.Product;
import com.example.Homeberries.service.ProductService;
import lombok.RequiredArgsConstructor;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;


import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class ProductServiceImpl implements ProductService {
    private final ProductRepository productRepository;
    private final FileService fileService;
    private final CategoryRepository categoryRepository;

    @Override
    public ProductDto getProductById(Long id) {
        Product product = productRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Product not found"));
        return convertToDto(product);
    }

    @Override
    public Page<ProductDto> searchProducts(String name, Long id, Pageable pageable) {
        try {
            Page<Product> products;

            if (name != null && !name.isEmpty()) {
                products = productRepository.findByNameContainingIgnoreCase(name, pageable);
            } else if (id != null) {
                products = productRepository.findByCategoryId(id, pageable);
            } else {
                products = productRepository.findAll(pageable);
            }

            if (products == null) {
                return Page.empty(pageable);
            }

            return products
                    .map(this::convertToDto);

        } catch (Exception e) {
            return Page.empty(pageable);
        }
    }

    @Override
    @Transactional
    public ProductDto createProduct(ProductDto dto, MultipartFile imageFile) {
        String imageUrl = fileService.saveImage(imageFile);

        Category category = null;

        if (dto.getCategoryId() != null) {
            category = categoryRepository.findById(dto.getCategoryId())
                    .orElse(null);
        }

        Product product = Product.builder()
                .name(dto.getName())
                .description(dto.getDescription())
                .price(dto.getPrice())
                .stock(dto.getStock() != null ? dto.getStock() : 0)
                .imageUrl(imageUrl)
                .category(category)
                .createdAt(LocalDateTime.now())
                .build();

        Product saved = productRepository.save(product);

        return convertToDto(saved);
    }

    private ProductDto convertToDto (Product product) {
        return ProductDto.builder()
                .id(product.getId())
                .name(product.getName())
                .description(product.getDescription())
                .price(product.getPrice())
                .stock(product.getStock())
                .imageUrl(product.getImageUrl())
                .categoryId(product.getCategory() != null ? product.getCategory().getId() : null)
                .categoryName(product.getCategory() != null ? product.getCategory().getName() : null)
                .build();
    }
}
