package com.example.demo.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.bean.HotelRoomList;

@Repository
public interface HotelRoomListDao extends CrudRepository<HotelRoomList, Integer>{

	
	
}
