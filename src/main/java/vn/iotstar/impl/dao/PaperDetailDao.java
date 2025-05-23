package vn.iotstar.impl.dao;

import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;
import vn.iotstar.configs.JPAConfig;
import vn.iotstar.dao.IPaperDetailDao;
import vn.iotstar.entity.*;

public class PaperDetailDao implements IPaperDetailDao {
	private EntityManagerFactory emf = Persistence.createEntityManagerFactory("jpa-hibernate-mysql");

	@Override
	public List<PaperDetail> getAllPaperDetails() {
		EntityManager em = emf.createEntityManager();
		List<PaperDetail> paperDetails = new ArrayList<>();
		try {
			String sql = "SELECT pd FROM PaperDetail pd";
			paperDetails = em.createQuery(sql, PaperDetail.class).getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (em != null && em.isOpen()) {
				em.close(); // Đảm bảo đóng EntityManager sau khi sử dụng
			}
		}
		return paperDetails;
	}

	@Override
	public PaperDetail findById(int id) {
		EntityManager em = emf.createEntityManager();
		try {
			return em.find(PaperDetail.class, id);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			em.close();
		}
	}

	@Override
	public void addPaperDetail(PaperDetail paperDetail) {
		EntityManager em = JPAConfig.getEntityManager();
		EntityTransaction trans = em.getTransaction();

		try {
			trans.begin();
			em.persist(paperDetail);
			em.flush(); // RẤT QUAN TRỌNG để cập nhật paperDetail.getId()
			trans.commit();
		} catch (Exception e) {
			if (trans.isActive()) {
				trans.rollback();
			}
			e.printStackTrace();
		} finally {
			if (em != null && em.isOpen()) {
				em.close();
			}
		}
	}
	@Override
	public void updatePaperDetail(PaperDetail paperDetail) {
		EntityManager em = JPAConfig.getEntityManager();
		EntityTransaction trans = em.getTransaction();

		try {
			trans.begin();
			em.merge(paperDetail);  // Cập nhật dựa trên primary key (id)
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			if (trans.isActive()) {
				trans.rollback();
			}
		} finally {
			em.close();
		}
	}
}
