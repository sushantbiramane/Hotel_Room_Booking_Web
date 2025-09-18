package com.example.demo.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.bean.Checkout;

@Repository
public interface CheckoutDao extends CrudRepository<Checkout, Integer>{

}
