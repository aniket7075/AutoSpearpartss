package com.autopart.respo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.autopart.model.Cart;
import com.autopart.model.Product;
import com.autopart.model.user;

public interface cartinfo extends JpaRepository<Cart, Integer> {
    List<Cart> findByUser(user user);
    Cart findByUserAndProduct(user user, Product product);
}