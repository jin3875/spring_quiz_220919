package com.quiz.lesson03.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.quiz.lesson03.model.RealEstate;

@Repository
public interface RealEstateDAO {
	
	public RealEstate selectRealEstate(int id);
	
	public List<RealEstate> selectRealEstateRentPriceList(int rentPrice);
	
	public List<RealEstate> selectRealEstateAreaAndPriceList(HashMap<String, Integer> areaAndPrice);

}
