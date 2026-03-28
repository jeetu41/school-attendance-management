package com.school.attendance.controller;

import org.springframework.web.bind.annotation.*;
import org.springframework.http.ResponseEntity;
import org.springframework.http.HttpStatus;

@RestController
@RequestMapping("/auth")
public class AuthController {

    @PostMapping("/login")
    public ResponseEntity<String> login(@RequestBody LoginRequest request) {
        // Login logic here
        return ResponseEntity.ok("User logged in successfully");
    }

    @PostMapping("/register")
    public ResponseEntity<String> register(@RequestBody RegisterRequest request) {
        // Registration logic here
        return ResponseEntity.status(HttpStatus.CREATED).body("User registered successfully");
    }

    @PostMapping("/logout")
    public ResponseEntity<String> logout() {
        // Logout logic here
        return ResponseEntity.ok("User logged out successfully");
    }

    @PostMapping("/refresh-token")
    public ResponseEntity<String> refreshToken() {
        // Logic for refreshing token
        return ResponseEntity.ok("Token refreshed successfully");
    }
}

class LoginRequest {
    private String username;
    private String password;
    // Getters and setters
}

class RegisterRequest {
    private String username;
    private String password;
    // Getters and setters
}