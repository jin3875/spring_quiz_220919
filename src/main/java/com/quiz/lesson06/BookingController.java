package com.quiz.lesson06;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.bo.BookingBO;
import com.quiz.lesson06.model.Booking;

@RequestMapping("/booking")
@Controller
public class BookingController {
	
	@Autowired
	private BookingBO bookingBO;
	
	@GetMapping("/booking_list_view")
	public String bookingListView(Model model) {
		List<Booking> bookingList = bookingBO.getBookingList();
		model.addAttribute("bookingList", bookingList);
		
		return "booking/bookingList";
	}
	
	@ResponseBody
	@DeleteMapping("/delete_booking")
	public Map<String, Object> deleteBooking(@RequestParam("id") int id) {
		Map<String, Object> result = new HashMap<>();
		
		int row = bookingBO.deleteBookingById(id);
		if (row > 0) {
			result.put("code", 1);
			result.put("result", "성공");
		} else {
			result.put("code", 500);
			result.put("result", "실패");
			result.put("error_message", "삭제된 행이 없습니다.");
		}
		
		return result;
	}
	
	@GetMapping("/booking_view")
	public String bookingView() {
		return "booking/booking";
	}
	
	@ResponseBody
	@PostMapping("/add_booking")
	public Map<String, Object> addBooking(
			@RequestParam("name") String name,
			@RequestParam("headcount") int headcount,
			@RequestParam("day") int day,
			@RequestParam("date") String date,
			@RequestParam("phoneNumber") String phoneNumber
	) {
		Map<String, Object> result = new HashMap<>();
		
		int row = bookingBO.addBooking(name, headcount, day, date, phoneNumber);
		if (row > 0) {
			result.put("code", 1);
			result.put("result", "성공");
		} else {
			result.put("code", 500);
			result.put("result", "실패");
			result.put("error_message", "추가된 행이 없습니다.");
		}
		
		return result;
	}
	
	@GetMapping("/main_view")
	public String mainView() {
		return "booking/main";
	}
	
	@ResponseBody
	@PostMapping("/get_booking")
	public Map<String, Object> getBooking(
			@RequestParam("name") String name,
			@RequestParam("phoneNumber") String phoneNumber
	) {
		Map<String, Object> result = new HashMap<>();
		
		Booking booking = bookingBO.getBookingListByNameAndPhoneNumber(name, phoneNumber);
		if (booking != null) {
			Date date = booking.getDate();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String dateStr = sdf.format(date);
			
			result.put("code", 1);
			result.put("result", "성공");
			result.put("name", booking.getName());
			result.put("date", dateStr);
			result.put("day", booking.getDay());
			result.put("headcount", booking.getHeadcount());
			result.put("state", booking.getState());
		} else {
			result.put("code", 500);
			result.put("result", "실패");
			result.put("error_message", "예약 내역이 없습니다");
		}
		
		return result;
	}

}
