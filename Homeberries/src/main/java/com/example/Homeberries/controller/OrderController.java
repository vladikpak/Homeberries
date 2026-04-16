package com.example.Homeberries.controller;

import com.example.Homeberries.dto.CartDto;
import com.example.Homeberries.dto.OrderDto;
import com.example.Homeberries.dto.UserDto;
import com.example.Homeberries.model.Cart;
import com.example.Homeberries.model.Order;
import com.example.Homeberries.model.User;
import com.example.Homeberries.service.CartService;
import com.example.Homeberries.service.OrderService;
import com.example.Homeberries.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
@RequestMapping("/orders")
public class OrderController {
    private final OrderService orderService;
    private final UserService userService;
    private final CartService cartService;

    private Long getCurrentUser(Authentication auth) {
        UserDto userDto = userService.findByEmail(auth.getName());
        return userDto.getId();
    }

    @GetMapping
    public String listOrders(Authentication auth, @RequestParam(defaultValue = "0") int page, Model model) {
        try {
            Long user = getCurrentUser(auth);
            Pageable pageable = PageRequest.of(page, 10);
            Page<OrderDto> orders = orderService.getUserOrders(user, pageable);

            model.addAttribute("orders", orders.getContent());
            model.addAttribute("currentPage", page);
            model.addAttribute("totalPages", orders.getTotalPages());

            return "order/list";
        } catch (Exception e) {
            e.printStackTrace();
            return "error/error";
        }
    }

    @GetMapping("/checkout")
    public String checkoutPage(Authentication auth, Model model) {
        try {
            Long user = getCurrentUser(auth);
            CartDto cart = cartService.getCartByUser(user);

            if (cart.getItems().isEmpty()) {
                return "redirect:/cart?empty";
            }

            model.addAttribute("cart", cart);
            model.addAttribute("totalAmount", cartService.calculateTotal(cart));
            return "order/checkout";
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/cart?error";
        }
    }

    @PostMapping("/checkout")
    public String createOrder(Authentication auth) {
        try {
            Long user = getCurrentUser(auth);
            orderService.createOrder(user);
            return "redirect:/orders?success";
        } catch (Exception e) {
            e.printStackTrace();
            return "error/error";
        }
    }

    @GetMapping("/{id}")
    public String orderDetails(@PathVariable Long id, Model model) {
        try {
            OrderDto order = orderService.getOrderById(id);
            model.addAttribute("order", order);
            return "order/details";
        } catch (Exception e) {
            e.printStackTrace();
            return "error/error";
        }

    }
}
