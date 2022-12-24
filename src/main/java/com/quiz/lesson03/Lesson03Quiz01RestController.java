package com.quiz.lesson03;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson03.bo.RealEstateBO;
import com.quiz.lesson03.model.RealEstate;

@RequestMapping("/lesson03/quiz01")
@RestController
public class Lesson03Quiz01RestController {
	
	@Autowired
	private RealEstateBO realEstateBO;
	
	@RequestMapping("/1")
	public RealEstate quiz01(@RequestParam(value="id") int id) {
		return realEstateBO.getRealEstate(id);
	}
	
	@RequestMapping("/2")
	public List<RealEstate> quiz02(@RequestParam(value="rent_price") int rentPrice) {
		return realEstateBO.getRealEstateRentPriceList(rentPrice);
	}
	
	@RequestMapping("/3")
	public List<RealEstate> quiz03(
			@RequestParam(value="area") int area, @RequestParam(value="price") int price
	) {
		HashMap<String, Integer> areaAndPrice = new HashMap<>();
		areaAndPrice.put("area", area);
		areaAndPrice.put("price", price);
		
		return realEstateBO.getRealEstateAreaAndPriceList(areaAndPrice);
	}

}
