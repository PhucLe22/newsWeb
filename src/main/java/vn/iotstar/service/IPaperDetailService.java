package vn.iotstar.service;

import java.util.List;

import vn.iotstar.entity.PaperDetail;

public interface IPaperDetailService {
	public List<PaperDetail> getAllPaperDetails();
	public PaperDetail findById(int id);
	public void addPaperDetail(PaperDetail paperDetail);
	public void updatePaperDetail(PaperDetail paperDetail);
}
