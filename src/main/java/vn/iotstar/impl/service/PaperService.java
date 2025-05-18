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
	public List<Object[]> getBestPapers(int limit) 
	{
		return paperDao.getBestPapers(limit);
	}
	@Override
	public List<Object[]> getTodayPapers(int limit)
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
}
