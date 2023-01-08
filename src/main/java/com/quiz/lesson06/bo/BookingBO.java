package com.quiz.lesson06.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson06.dao.BookingDAO;
import com.quiz.lesson06.model.Booking;

@Service
public class BookingBO {
	
	@Autowired
	private BookingDAO bookingDAO;
	
	public List<Booking> getBookingList() {
		return bookingDAO.selectBookingList();
	}
	
	public int addBooking(String name, int headcount, int day, String date, String phoneNumber) {
		return bookingDAO.insertBooking(name, headcount, day, date, phoneNumber);
	}
	
	public int deleteBookingById(int id) {
		return bookingDAO.deleteBookingById(id);
	}
	
	public Booking getBookingListByNameAndPhoneNumber(String name, String phoneNumber) {
		List<Booking> bookingList = bookingDAO.selectBookingListByNameAndPhoneNumber(name, phoneNumber);
		
		if (bookingList.isEmpty() == false) {
			return bookingList.get(0);
		}
		
		return null;
	}

}
