package com.autopart.respo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.autopart.model.user;

public interface userinfo extends JpaRepository<user, Integer> {
    user findByEmail(String email);
}
