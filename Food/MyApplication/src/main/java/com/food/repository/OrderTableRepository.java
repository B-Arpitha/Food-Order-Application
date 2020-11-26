package com.food.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.food.model.Order_Table;

@Repository
public interface OrderTableRepository extends JpaRepository<Order_Table, Integer> {

}
