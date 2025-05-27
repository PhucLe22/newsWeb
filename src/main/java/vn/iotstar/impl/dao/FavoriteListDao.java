package vn.iotstar.impl.dao;

import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.TypedQuery;
import vn.iotstar.configs.JPAConfig;
import vn.iotstar.dao.IFavoriteListDao;
import vn.iotstar.entity.FavoriteList;
import vn.iotstar.entity.User;

public class FavoriteListDao implements IFavoriteListDao {
	private EntityManagerFactory emf = Persistence.createEntityManagerFactory("jpa-hibernate-mysql");

	@Override
	public List<FavoriteList> findByUserId(int userId) { // dùng Long cho thống nhất
		EntityManager entityManager = emf.createEntityManager();
		List<FavoriteList> result = null;
		try {
			String jpql = "SELECT f FROM FavoriteList f WHERE f.user.id = :userId";
			TypedQuery<FavoriteList> query = entityManager.createQuery(jpql, FavoriteList.class);
			query.setParameter("userId", userId);
			result = query.getResultList();
		} finally {
			entityManager.close();
		}
		return result;
	}

	@Override
	public FavoriteList save(FavoriteList favoriteList) {
		EntityManager entityManager = emf.createEntityManager();
		try {
			entityManager.getTransaction().begin();
			FavoriteList savedEntity;
			if (favoriteList.getId() == null) {
				entityManager.persist(favoriteList);
				entityManager.flush(); // Đảm bảo ID được generate ngay lập tức
				savedEntity = favoriteList; // persist() sẽ update object gốc với ID
			} else {
				savedEntity = entityManager.merge(favoriteList); // merge() return entity đã được managed
			}
			entityManager.getTransaction().commit();
			return savedEntity;
		} catch (Exception e) {
			e.printStackTrace();
			if (entityManager.getTransaction().isActive()) {
				entityManager.getTransaction().rollback();
			}
			return null; // hoặc throw exception
		} finally {
			entityManager.close();
		}
	}

	@Override
	public List<FavoriteList> findByUser(User user) {
		EntityManager em = JPAConfig.getEntityManager();
		try {
			TypedQuery<FavoriteList> query = em.createQuery("SELECT f FROM FavoriteList f WHERE f.user.id = :userId",
					FavoriteList.class);
			query.setParameter("userId", user.getId());
			return query.getResultList();
		} finally {
			em.close();
		}
	}

	@Override
	public FavoriteList findById(int id) {
		EntityManager em = JPAConfig.getEntityManager();
		try {
			TypedQuery<FavoriteList> query = em.createQuery("SELECT f FROM FavoriteList f WHERE f.id = :id",
					FavoriteList.class);
			query.setParameter("id", id);
			return query.getSingleResult();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			em.close();
		}
	}

}
