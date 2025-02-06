package com.autopart.respo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.autopart.model.Product;


public interface productinfo extends JpaRepository<Product, Integer>
{
	
}
