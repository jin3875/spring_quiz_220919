package com.quiz.lesson06.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson06.dao.FavoriteDAO;
import com.quiz.lesson06.model.Favorite;

@Service
public class FavoriteBO {
	
	@Autowired
	private FavoriteDAO favoriteDAO;
	
	public void addFavorite(String name, String url) {
		favoriteDAO.insertFavorite(name, url);
	}
	
	public List<Favorite> getFavoriteList() {
		return favoriteDAO.selectFavoriteList();
	}
	
	public Favorite getFavoriteByUrl(String url) {
		List<Favorite> favoriteList = favoriteDAO.selectFavoriteByUrl(url);
		if (favoriteList.isEmpty() == false) {
			return favoriteList.get(0);
		}
		return null;
	}
	
	public int deleteFavoriteById(int id) {
		return favoriteDAO.deleteFavoriteById(id);
	}

}
