package vn.iotstar.service;

import java.util.List;

import vn.iotstar.entity.Paper;
import vn.iotstar.entity.PaperDetail;
import vn.iotstar.entity.PaperType;

public interface IPaperService {
	public List<Paper> searchByKeyword(String keyword);

	public List<Paper> getAllPapers();

	public List<Paper> getBestPapers(int limit);

	public List<Paper> getTodayPapers(int limit);
	
	public Paper findById(int id);

	public void addPaper(Paper Paper);

	public List<Paper> getForeignRelatedPapers();
	
	public List<PaperType> getAllPaperTypes();

	public void addPaperType(PaperType PaperType); 
	
	public boolean updatePaperType(PaperType PaperType);
	
	public PaperType getPaperTypeById(int id);
}
