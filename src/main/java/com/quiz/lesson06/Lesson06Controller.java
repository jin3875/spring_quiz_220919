package com.quiz.lesson06;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	@GetMapping("/quiz02/is_duplication")
	public Map<String, Boolean> isDuplication(@RequestParam("url") String url) {
		Map<String, Boolean> result = new HashMap<>();
		result.put("is_duplication", favoriteBO.existFavoriteByUrl(url));
		return result;
	}
	
	@ResponseBody
	@GetMapping("/quiz02/delete_favorite")
	public Map<String, Boolean> deleteFavorite(@RequestParam("id") int id) {
		Map<String, Boolean> result = new HashMap<>();
		
		if (favoriteBO.deleteFavoriteById(id) == 1) {
			result.put("is_deleted", true);
		} else {
			result.put("is_deleted", false);
		}
		
		return result;
	}

}
