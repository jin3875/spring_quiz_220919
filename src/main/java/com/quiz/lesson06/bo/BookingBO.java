package com.quiz.lesson06.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson06.dao.BookingDAO;
import com.quiz.lesson06.model.Booking;

@Service
public class BookingBO {
	
	@Autowired
	private BookingDAO bookingDAO;
	
	public List<Booking> getBookingList() {
		return bookingDAO.selectBookingList();
	}
	
	public int deleteBookingById(int id) {
		return bookingDAO.deleteBookingById(id);
	}
	
	public void addBooking(String name, int headcount, int day, String date, String phoneNumber) {
		bookingDAO.insertBooking(name, headcount, day, date, phoneNumber);
	}
	
	public Booking getLatestBookingByNamePhoneNumber(String name, String phoneNumber) {
		return bookingDAO.selectLatestBookingByNamePhoneNumber(name, phoneNumber);
	}

}
