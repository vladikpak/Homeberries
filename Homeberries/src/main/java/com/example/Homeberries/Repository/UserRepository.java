package com.example.Homeberries.Repository;

import com.example.Homeberries.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository <User, Long> {
    Optional<User> findByEmail(String email);
    Boolean existsByEmail(String email);
}
