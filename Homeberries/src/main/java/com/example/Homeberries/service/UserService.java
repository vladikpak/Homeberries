package com.example.Homeberries.service;

import com.example.Homeberries.dto.UserDto;
import com.example.Homeberries.model.User;
import org.springframework.transaction.annotation.Transactional;

public interface UserService {
    @Transactional
    UserDto registerUser(UserDto userDto);

    UserDto findByEmail(String email);

    @Transactional
    UserDto updateProfile(Long userId, UserDto userDto);
}
