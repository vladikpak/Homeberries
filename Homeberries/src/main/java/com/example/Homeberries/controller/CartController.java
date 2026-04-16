package com.example.Homeberries.controller;

import com.example.Homeberries.dto.CartDto;
import com.example.Homeberries.dto.UserDto;
import com.example.Homeberries.model.Cart;
import com.example.Homeberries.model.User;
import com.example.Homeberries.service.CartService;
import com.example.Homeberries.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
@RequestMapping("/cart")
public class CartController {
    private final CartService cartService;
    private final UserService userService;

    private Long getCurrentUser(Authentication auth) {
        UserDto userDto = userService.findByEmail(auth.getName());
        return userDto.getId();
    }

    @GetMapping
    public String viewCart(Authentication auth, Model model) {
        try {
            Long user = getCurrentUser(auth);
            CartDto cart = cartService.getCartByUser(user);
            Integer totalAmount = cartService.calculateTotal(cart);

            model.addAttribute("cart", cart);
            model.addAttribute("totalAmount", totalAmount);
            return "cart/view";
        } catch (Exception e) {
            e.printStackTrace();
            return "error/error";
        }
    }

    @PostMapping("/add/{productId}")
    public String addToCart(@PathVariable Long productId, @RequestParam(defaultValue = "1") int quantity, Authentication auth) {
        try {
            Long user = getCurrentUser(auth);
            cartService.addToCart(user, productId, quantity);
            return "redirect:/cart";
        } catch (Exception e) {
            e.printStackTrace();
            return "error/error";
        }
    }

    @PostMapping("/remove/{productId}")
    public String removeFromCart(@PathVariable Long productId, Authentication auth) {
        Long user = getCurrentUser(auth);
        cartService.removeFromCart(user, productId);
        return "redirect:/cart";
    }

    @PostMapping("/update/{productId}")
    public String updateQuantity(@PathVariable Long productId, @RequestParam int quantity, Authentication auth) {
        Long user = getCurrentUser(auth);
        cartService.updateQuantity(user, productId, quantity);
        return "redirect:/cart";
    }

    @PostMapping("/clear")
    public String clearCart(Authentication auth) {
        Long user = getCurrentUser(auth);
        cartService.clearCart(user);
        return "redirect:/cart";
    }
}
