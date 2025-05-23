package vn.iotstar.service;

import java.util.List;

import vn.iotstar.entity.FavoriteList;

public interface IFavoriteListService {
	public List<FavoriteList> findByUserId(int userId);
	public boolean save(FavoriteList favoriteList);
}
