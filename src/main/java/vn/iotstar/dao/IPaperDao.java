package vn.iotstar.dao;

import java.util.List;

import vn.iotstar.entity.Paper;
import vn.iotstar.entity.PaperDetail;

public interface IPaperDao {
	public List<Paper> searchByKeyword(String keyword);
	public List<Paper> getAllPapers();
	public List<Object[]> getBestPapers(int limit); 
	public List<Object[]> getTodayPapers(int limit);
	public Paper findById(int id);
	public void addPaper(Paper Paper);
}
