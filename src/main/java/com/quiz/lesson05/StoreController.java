package com.quiz.lesson05;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson02.bo.StoreBO;
import com.quiz.lesson02.model.Store;
import com.quiz.lesson05.bo.ReviewBO;
import com.quiz.lesson05.model.Review;

@RequestMapping("/lesson05")
@Controller
public class StoreController {
	
	@Autowired
	private StoreBO storeBO;
	
	@Autowired
	private ReviewBO reviewBO;
	
	@GetMapping("/store_list_view")
	public String storeListView(Model model) {
		List<Store> storeList = storeBO.getStoreList();
		model.addAttribute("storeList", storeList);
		
		return "store/storeList";
	}
	
	@GetMapping("/store_review_view")
	public String storeReviewView(
			@RequestParam("storeId") int storeId,
			@RequestParam("storeName") String storeName,
			Model model
	) {
		List<Review> reviewList = reviewBO.getReviewList(storeId);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("storeName", storeName);
		
		return "store/storeReview";
	}

}
