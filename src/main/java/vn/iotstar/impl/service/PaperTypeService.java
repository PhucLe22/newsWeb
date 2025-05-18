package vn.iotstar.impl.service;

import java.util.List;

import vn.iotstar.dao.IPaperTypeDao;
import vn.iotstar.entity.PaperType;
import vn.iotstar.impl.dao.PaperTypeDao;
import vn.iotstar.service.IPaperTypeService;

public class PaperTypeService implements IPaperTypeService {
	private final IPaperTypeDao paperTypeDao = new PaperTypeDao();
	@Override
	public List<PaperType> getAllPaperTypes()
	{
		return paperTypeDao.getAllPaperTypes();
	}
	public void addPaperType(PaperType paperType) 
	{
		paperTypeDao.getAllPaperTypes();
	}
	public PaperType getPaperTypeById(int id)
	{
		return paperTypeDao.getPaperTypeById(id);
	}
	
}
