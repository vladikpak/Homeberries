package com.example.Homeberries.service;

import com.example.Homeberries.dto.OrderDto;
import com.example.Homeberries.model.Order;
import com.example.Homeberries.model.User;
import jakarta.transaction.Transactional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface OrderService {
    OrderDto createOrder(Long userId);

    OrderDto getOrderById(Long id);

    Page<OrderDto> getUserOrders(Long userId, Pageable pageable);
}
