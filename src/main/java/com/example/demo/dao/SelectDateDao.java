package com.example.demo.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.bean.SelectDate;

@Repository
public interface SelectDateDao extends CrudRepository<SelectDate, Integer>{

}
