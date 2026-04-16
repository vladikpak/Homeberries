package com.example.Homeberries.controller;

import com.example.Homeberries.service.CategoryService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
@RequestMapping("/categories")
public class CategoryController {
    private final CategoryService categoryService;

    @GetMapping
    public String listCategories(Model model) {
        try {
            model.addAttribute("categories", categoryService.getAllCategories());
            return "category/list";
        } catch (Exception e) {
            e.printStackTrace();
            return "error/error";
        }

    }
}