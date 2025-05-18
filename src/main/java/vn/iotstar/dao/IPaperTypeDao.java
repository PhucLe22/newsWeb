package vn.iotstar.dao;

import java.util.List;

import vn.iotstar.entity.*;
public interface IPaperTypeDao {
	public List<PaperType> getAllPaperTypes();
	public PaperType getPaperTypeById(int id);
	public void addPaperType(PaperType paperType);
}
