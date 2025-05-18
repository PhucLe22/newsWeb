package vn.iotstar.impl.service;

import java.util.List;

import vn.iotstar.dao.IPaperDetailDao;
import vn.iotstar.entity.PaperDetail;
import vn.iotstar.impl.dao.PaperDetailDao;
import vn.iotstar.service.IPaperDetailService;

public class PaperDetailService implements IPaperDetailService {
	private final IPaperDetailDao paperDetailDao = new PaperDetailDao();
	public List<PaperDetail> getAllPaperDetails()
	{
		return paperDetailDao.getAllPaperDetails();
	}
	@Override
	public PaperDetail findById(int id)
	{
		return paperDetailDao.findById(id);
	}
	@Override
	public void addPaperDetail(PaperDetail paperDetail)
	{
		paperDetailDao.addPaperDetail(paperDetail);
	}
}
