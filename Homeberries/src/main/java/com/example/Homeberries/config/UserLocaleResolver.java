package com.example.Homeberries.config;

import com.example.Homeberries.Repository.UserRepository;
import com.example.Homeberries.model.User;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.LocaleResolver;

import java.util.Locale;

@Component
@RequiredArgsConstructor
public class UserLocaleResolver implements LocaleResolver {

    private final UserRepository userRepository;

    @Override
    public Locale resolveLocale(HttpServletRequest request) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();

        if (auth != null && auth.isAuthenticated() && !"anonymousUser".equals(auth.getPrincipal())) {
            String email = auth.getName();
            User user = userRepository.findByEmail(email)
                    .orElse(null);

            if (user != null && user.getPreferredLanguage() != null) {
                return new Locale(user.getPreferredLanguage());
            }
        }
        return request.getLocale();
    }

    @Override
    public void setLocale(HttpServletRequest request, HttpServletResponse response, Locale locale) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();

        if (auth != null && auth.isAuthenticated() && !"anonymousUser".equals(auth.getPrincipal())) {
            String email = auth.getName();
            User user = userRepository.findByEmail(email)
                    .orElse(null);

            if (user != null) {
                user.setPreferredLanguage(locale.getLanguage());
                userRepository.save(user);
            }
        }
    }
}