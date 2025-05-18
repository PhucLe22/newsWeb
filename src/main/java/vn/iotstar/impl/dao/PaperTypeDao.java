package vn.iotstar.impl.dao;

import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;
import vn.iotstar.configs.JPAConfig;
import vn.iotstar.dao.IPaperTypeDao;
import vn.iotstar.entity.*;

public class PaperTypeDao implements IPaperTypeDao  {
	private EntityManagerFactory emf = Persistence.createEntityManagerFactory("jpa-hibernate-mysql");
	@Override
	public List<PaperType> getAllPaperTypes() {
	    EntityManager em = emf.createEntityManager();
	    List<PaperType> paperTypes = new ArrayList<>();
	    try {
	        String sql = "SELECT pt FROM PaperType pt";
	        paperTypes = em.createQuery(sql, PaperType.class).getResultList();
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        if (em != null && em.isOpen()) {
	            em.close(); // Đảm bảo đóng EntityManager sau khi sử dụng
	        }
	    }
	    return paperTypes;
	}
	@Override
	public void addPaperType(PaperType paperType) {
	    EntityManager em = JPAConfig.getEntityManager();
	    EntityTransaction trans = em.getTransaction();

	    try {
	        if (paperType == null) {
	            throw new IllegalArgumentException("PaperType cannot be null");
	        }

	        trans.begin();

	        // Lưu PaperType vào DB
	        em.persist(paperType);

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
	public PaperType getPaperTypeById(int id) {
	    EntityManager em = JPAConfig.getEntityManager();
	    try {
	        return em.find(PaperType.class, id);
	    } catch (Exception e) {
	        e.printStackTrace();
	        return null;
	    } finally {
	        em.close();
	    }
	}
}
