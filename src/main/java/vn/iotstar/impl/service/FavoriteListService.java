package vn.iotstar.impl.service;

import java.util.List;

import vn.iotstar.dao.IFavoriteListDao;
import vn.iotstar.entity.FavoriteList;
import vn.iotstar.entity.User;
import vn.iotstar.impl.dao.FavoriteListDao;
import vn.iotstar.service.IFavoriteListService;

public class FavoriteListService implements IFavoriteListService {

	private final IFavoriteListDao favoriteListDao = new FavoriteListDao();

	public List<FavoriteList> findByUserId(int userId) {
		return favoriteListDao.findByUserId(userId);
	}

	public FavoriteList save(FavoriteList favoriteList) {
		return favoriteListDao.save(favoriteList);
	}

	public List<FavoriteList> findByUser(User user) 
	{
		return favoriteListDao.findByUser(user);
	}
	public FavoriteList findById(int id)
	{
		return favoriteListDao.findById(id);
	}
}
