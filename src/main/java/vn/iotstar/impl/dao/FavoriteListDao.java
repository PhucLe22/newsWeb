package vn.iotstar.impl.dao;

import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.TypedQuery;

import vn.iotstar.dao.IFavoriteListDao;
import vn.iotstar.entity.FavoriteList;

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
	public boolean save(FavoriteList favoriteList) {
		EntityManager entityManager = emf.createEntityManager();
		try {
			entityManager.getTransaction().begin();
			if (favoriteList.getId() == null) {
				entityManager.persist(favoriteList);
			} else {
				entityManager.merge(favoriteList);
			}
			entityManager.getTransaction().commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			if (entityManager.getTransaction().isActive()) {
				entityManager.getTransaction().rollback();
			}
			return false;
		} finally {
			entityManager.close();
		}
	}
}
