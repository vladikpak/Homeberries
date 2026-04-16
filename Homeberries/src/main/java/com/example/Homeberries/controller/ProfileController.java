package com.example.Homeberries.controller;

import com.example.Homeberries.dto.UserDto;
import com.example.Homeberries.model.User;
import com.example.Homeberries.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/profile")
public class ProfileController {
    private final UserService userService;

    private UserDto getCurrentUser(Authentication auth) {
        return userService.findByEmail(auth.getName());
    }

    @GetMapping
    public String viewProfile(Authentication auth, Model model) {
        UserDto user = getCurrentUser(auth);
        model.addAttribute("user", user);
        return "profile/profile";
    }

    @GetMapping("/edit")
    public String editProfileForm(Authentication auth, Model model) {
        UserDto user = getCurrentUser(auth);
        model.addAttribute("user", user);
        return "profile/edit";
    }

    @PostMapping("/edit")
    public String updateProfile(@ModelAttribute UserDto userDto, Authentication auth, Model model) {
        try {
            UserDto user = getCurrentUser(auth);
            userService.updateProfile(user.getId(), userDto);
            return "redirect:/profile?success";
        } catch (Exception e) {
            model.addAttribute("error", e.getMessage());
            return "profile/edit";
        }
    }
}
