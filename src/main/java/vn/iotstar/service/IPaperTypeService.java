package vn.iotstar.service;

import java.util.List;

import vn.iotstar.entity.PaperType;

public interface IPaperTypeService {
	public List<PaperType> getAllPaperTypes();
	public void addPaperType(PaperType paperType);
	PaperType getPaperTypeById(int id);
}
