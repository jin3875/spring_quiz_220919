package com.quiz.lesson04.dao;

import org.apache.ibatis.annotations.Param;

public interface SellerDAO {
	
	public void insertSeller(
			@Param("nickname") String nickname,
			@Param("profileImageUrl") String profileImageUrl,
			@Param("temperature") double temperature);

}
