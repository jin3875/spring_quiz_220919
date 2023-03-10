package com.quiz.lesson06;

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

import com.quiz.lesson06.bo.FavoriteBO;
import com.quiz.lesson06.model.Favorite;

@RequestMapping("/lesson06")
@Controller
public class Lesson06Controller {
	
	@Autowired
	private FavoriteBO favoriteBO;
	
	@GetMapping("/quiz01/add_favorite_view")
	public String addFavoriteView() {
		return "lesson06/quiz01/addFavorite";
	}
	
	@ResponseBody
	@PostMapping("/quiz01/add_favorite")
	public Map<String, String> addFavorite(
			@RequestParam("name") String name,
			@RequestParam("url") String url
	) {
		favoriteBO.addFavorite(name, url);
		
		Map<String, String> result = new HashMap<>();
		result.put("result", "성공");
		
		return result; // jackson => JSON String
	}
	
	@GetMapping("/quiz01/after_add_favorite_view")
	public String afterAddFavoriteView(Model model) {
		List<Favorite> favoriteList = favoriteBO.getFavoriteList();
		model.addAttribute("favoriteList", favoriteList);
		
		return "lesson06/quiz01/afterAddFavorite";
	}
	
	@ResponseBody
	@PostMapping("/quiz02/is_duplication_url")
	public Map<String, Boolean> isDuplicationUrl(@RequestParam("url") String url) {
		Map<String, Boolean> result = new HashMap<>();
		
		Favorite favorite = favoriteBO.getFavoriteByUrl(url);
		if (favorite != null) {
			result.put("is_duplication", true);
		} else {
			result.put("is_duplication", false);
		}
		
		return result;
	}
	
//	Mapping 종류
//	Read   - GET : 조회 - 쿼리스트링, request body 없음
//	Create - POST : insert, add
//	Update - PUT : 수정
//	Delete - DELETE : 삭제
	
	@ResponseBody
	@DeleteMapping("/quiz02/delete_favorite")
	public Map<String, Object> deleteFavorite(@RequestParam("id") int id) {
		Map<String, Object> result = new HashMap<>();
		
		int row = favoriteBO.deleteFavoriteById(id);
		if (row > 0) {
			result.put("code", 1); // 성공
			result.put("result", "성공");
		} else {
			result.put("code", 500); // 실패
			result.put("result", "실패");
			result.put("error_message", "삭제된 행이 없습니다.");
		}
		
		return result;
	}

}
