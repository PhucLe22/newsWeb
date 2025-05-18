package vn.iotstar.dao;

import java.util.List;

import vn.iotstar.entity.PaperDetail;
import vn.iotstar.entity.PaperType;

public interface IPaperDetailDao {
	public List<PaperDetail> getAllPaperDetails();
	public PaperDetail findById(int id);
	public void addPaperDetail(PaperDetail paperDetail);
}
