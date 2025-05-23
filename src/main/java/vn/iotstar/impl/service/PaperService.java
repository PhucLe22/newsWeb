package vn.iotstar.impl.service;

import java.util.List;

import vn.iotstar.dao.IPaperDao;
import vn.iotstar.entity.*;
import vn.iotstar.impl.dao.*;
import vn.iotstar.service.*;

public class PaperService implements IPaperService {
	private final IPaperDao paperDao = new PaperDao();

	@Override
	public List<Paper> searchByKeyword(String keyword) {
		return paperDao.searchByKeyword(keyword);
	}
	@Override
	public List<Paper> getAllPapers()
	{
		return paperDao.getAllPapers();
	}
	@Override
	public List<Paper> getBestPapers(int limit) 
	{
		return paperDao.getBestPapers(limit);
	}
	@Override
	public void saveComment(Comment comment) 
	{
		paperDao.insertComment(comment);
	}
	@Override
	public List<Paper> getTodayPapers(int limit)
	{
		return paperDao.getTodayPapers(limit);
	}
	@Override
	public Paper findById(int id)
	{
		return paperDao.findById(id);
	}
	@Override
	public void addPaper(Paper Paper)
	{
		paperDao.addPaper(Paper);
	}
	@Override
	public List<Paper> getForeignRelatedPapers()
	{
		return paperDao.getForeignRelatedPapers();
	}
	@Override
	public List<PaperType> getAllPaperTypes()
	{
		return paperDao.getAllPaperTypes();
	}
	@Override
	public void addPaperType(PaperType PaperType) 
	{ 
		paperDao.addPaperType(PaperType);
	}
	@Override
	public boolean updatePaperType(PaperType PaperType)
	{
		return paperDao.updatePaperType(PaperType);
	}
	@Override
	public PaperType getPaperTypeById(int id)
	{
		return paperDao.getPaperTypeById(id);
	}
	@Override
	public void updatePaper(Paper paper)
	{
		paperDao.updatePaper(paper);
	}
	@Override
	public boolean save(FavoriteList favoriteList)
	{
		return paperDao.save(favoriteList);
	}
	@Override
	public List<FavoriteList> getFavoriteListByUserId(int userId) 
	{
		return paperDao.getFavoriteListByUserId(userId);
	}
	@Override
	public Paper getPaperById(int id)
	{
		return paperDao.getPaperById(id);
	}
	@Override
	public List<FavoriteList> getAllFavoriteList()
	{
		return paperDao.getAllFavoriteList();
	}
}
