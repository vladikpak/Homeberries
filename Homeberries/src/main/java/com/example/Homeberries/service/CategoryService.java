package com.example.Homeberries.service;

import com.example.Homeberries.dto.CategoryDto;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface CategoryService {
    List<CategoryDto> getAllCategories();

}
