package com.example.demo.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.bean.BookingRegistrationBean;


@Repository
public interface BookingWebDao extends CrudRepository<BookingRegistrationBean, Integer>{

}
