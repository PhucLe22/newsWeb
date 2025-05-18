package vn.iotstar.impl.dao;

import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;
import jakarta.persistence.TypedQuery;
import vn.iotstar.configs.JPAConfig;
import vn.iotstar.dao.IPaperDao;
import vn.iotstar.entity.*;

public class PaperDao implements IPaperDao {
	private EntityManagerFactory emf = Persistence.createEntityManagerFactory("jpa-hibernate-mysql");

	@Override
	public List<Paper> searchByKeyword(String keyword) {
		EntityManager em = emf.createEntityManager();
		List<Paper> PaperResults = new ArrayList<>();
		try {
			String queryStr = "SELECT s FROM Paper s WHERE s.paperName LIKE :keyword"; // Same keyWord
			TypedQuery<Paper> query = em.createQuery(queryStr, Paper.class);
			query.setParameter("keyword", "%" + keyword + "%");
			PaperResults = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (em != null && em.isOpen())
				em.close();
		}
		return PaperResults;
	}

	@Override
	public List<Paper> getAllPapers() {
		EntityManager em = emf.createEntityManager();
		List<Paper> Papers = new ArrayList<>();
		try {
			String sql = "SELECT c FROM Paper c";
			Papers = em.createQuery(sql, Paper.class).getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (em != null && em.isOpen()) {
				em.close(); // Ensuring session is closed after use
			}
		}
		return Papers;
	}

	public List<Object[]> getBestPapers(int limit) {
		EntityManager em = emf.createEntityManager();
		List<Object[]> result = new ArrayList<>();
		try {
			String jpql = "SELECT r.paper, AVG(r.rate) as avgRate " + "FROM Review r " + "GROUP BY r.paper "
					+ "HAVING AVG(r.rate) >= 4 " + "ORDER BY avgRate DESC";
			result = em.createQuery(jpql, Object[].class).setMaxResults(limit).getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (em != null && em.isOpen()) {
				em.close();
			}
		}
		return result;
	}

	@Override
	public List<Object[]> getTodayPapers(int limit) {
		EntityManager em = emf.createEntityManager();
		List<Object[]> result = new ArrayList<>();
		try {
			String jpql = "SELECT p, pd " + "FROM Paper p JOIN p.paperDetail pd "
					+ "WHERE FUNCTION('DATE', pd.createdAt) = CURRENT_DATE " + "ORDER BY pd.createdAt DESC";
			result = em.createQuery(jpql, Object[].class).setMaxResults(limit).getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (em != null && em.isOpen()) {
				em.close();
			}
		}
		return result;
	}
	@Override
	public Paper findById(int id) {
	    EntityManager em = emf.createEntityManager();
	    try {
	        return em.find(Paper.class, id);
	    } catch (Exception e) {
	        e.printStackTrace();
	        return null;
	    } finally {
	        em.close();
	    }
	}
	@Override
	public void addPaper(Paper paper) {
	    EntityManager em = JPAConfig.getEntityManager();
	    EntityTransaction trans = em.getTransaction();

	    try {
	        if (paper == null) {
	            throw new IllegalArgumentException("Paper cannot be null");
	        }

	        trans.begin();

	        // Lấy PaperType từ DB dựa trên id
	        int paperTypeId = paper.getPaperType().getId();
	        PaperType paperType = em.find(PaperType.class, paperTypeId);
	        if (paperType == null) {
	            throw new IllegalArgumentException("PaperType not found with id: " + paperTypeId);
	        }
	        paper.setPaperType(paperType);

	        // Lấy PaperDetail từ DB dựa trên id (nếu paperDetail đã có id)
	        PaperDetail paperDetail = paper.getPaperDetail();
	        if (paperDetail != null) {
	            if (paperDetail.getId() != 0) {
	                PaperDetail persistedPaperDetail = em.find(PaperDetail.class, paperDetail.getId());
	                if (persistedPaperDetail == null) {
	                    throw new IllegalArgumentException("PaperDetail not found with id: " + paperDetail.getId());
	                }
	                paper.setPaperDetail(persistedPaperDetail);
	            } else {
	                // Nếu chưa có id thì lưu PaperDetail trước
	                em.persist(paperDetail);
	                // Giờ paperDetail có id rồi
	                paper.setPaperDetail(paperDetail);
	            }
	        } else {
	            throw new IllegalArgumentException("PaperDetail không được null");
	        }

	        // Lưu Paper
	        em.persist(paper);

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
}
