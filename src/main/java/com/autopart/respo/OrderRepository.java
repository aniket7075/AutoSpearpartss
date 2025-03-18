package com.autopart.respo;

import com.autopart.model.Order;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderRepository extends JpaRepository<Order, Long> 
{
    // You can add custom queries if needed here
	
}

