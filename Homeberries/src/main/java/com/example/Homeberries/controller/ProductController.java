package com.example.Homeberries.controller;

import com.example.Homeberries.dto.ProductDto;
import com.example.Homeberries.service.CategoryService;
import com.example.Homeberries.service.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequiredArgsConstructor
@RequestMapping("/products")
public class ProductController {
    private final ProductService productService;
    private final CategoryService categoryService;

    @GetMapping
    public String listProducts(@RequestParam(required = false) String name, @RequestParam(required = false) Long categoryId, @RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "12") int size, Model model) {
        try {
            Pageable pageable = PageRequest.of(page, size);
            Page<ProductDto> products = productService.searchProducts(name, categoryId, pageable);

            model.addAttribute("products", products.getContent());
            model.addAttribute("currentPage", page);
            model.addAttribute("totalPages", products.getTotalPages());
            model.addAttribute("totalElements", products.getTotalElements());
            model.addAttribute("categories", categoryService.getAllCategories());
            model.addAttribute("filterName", name);
            model.addAttribute("filterCategory", categoryId);

            return "product/list";
        } catch (Exception e) {
            e.printStackTrace();
            return "error/error";
        }

    }

    @GetMapping("/{id}")
    public String productDetails(@PathVariable Long id, Model model) {
        try {
            ProductDto product = productService.getProductById(id);
            model.addAttribute("product", product);
            return "product/details";
        } catch (Exception e) {
            e.printStackTrace();
            return "error/error";
        }
    }
}
