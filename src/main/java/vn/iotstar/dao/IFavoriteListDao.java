package vn.iotstar.dao;

import java.util.List;

import vn.iotstar.entity.FavoriteList;
import vn.iotstar.entity.User;

public interface IFavoriteListDao {
	public List<FavoriteList> findByUserId(int userId);

	public FavoriteList save(FavoriteList favoriteList);

	public List<FavoriteList> findByUser(User user);

	public FavoriteList findById(int id);
}
