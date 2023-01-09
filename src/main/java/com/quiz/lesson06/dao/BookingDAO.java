package com.quiz.lesson06.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson06.model.Booking;

@Repository
public interface BookingDAO {
	
	public List<Booking> selectBookingList();
	
	public int deleteBookingById(int id);
	
	public void insertBooking(
			@Param("name") String name,
			@Param("headcount") int headcount,
			@Param("day") int day,
			@Param("date") String date,
			@Param("phoneNumber") String phoneNumber);
	
	public Booking selectLatestBookingByNamePhoneNumber(
			@Param("name") String name,
			@Param("phoneNumber") String phoneNumber);

}
