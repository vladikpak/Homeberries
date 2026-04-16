package com.example.Homeberries;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@SpringBootApplication
public class HomeberriesApplication {

	public static void main(String[] args) {
		SpringApplication.run(HomeberriesApplication.class, args);

//		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
//		String encoded = encoder.encode("123456");
//		System.out.println("Пароль: " + encoded);
//		System.out.println("Длина: " + encoded.length());
	}

}
