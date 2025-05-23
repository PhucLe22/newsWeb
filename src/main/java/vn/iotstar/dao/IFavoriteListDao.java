package vn.iotstar.dao;

import java.util.List;

import vn.iotstar.entity.FavoriteList;

public interface IFavoriteListDao {
	public List<FavoriteList> findByUserId(int userId);
	public boolean save(FavoriteList favoriteList);
}
