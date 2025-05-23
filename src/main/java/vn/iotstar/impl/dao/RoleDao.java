package vn.iotstar.impl.dao;

import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;
import vn.iotstar.configs.JPAConfig;
import vn.iotstar.dao.IRoleDao;
import vn.iotstar.entity.Role;

public class RoleDao implements IRoleDao {
	@Override
	public Role findById(int id) {
		EntityManager enma = JPAConfig.getEntityManager();
		TypedQuery<Role> query = enma.createQuery("SELECT r FROM Role r WHERE r.id = :id", Role.class);
		query.setParameter("id", id);
		return query.getSingleResult();
	}

	@Override
	public List<Role> findByUserId2(int userId) {
		EntityManager enma = JPAConfig.getEntityManager();
		TypedQuery<Role> query = enma.createQuery("SELECT r FROM User u JOIN u.roles r WHERE u.id = :userId",
				Role.class);
		query.setParameter("userId", userId);
		return query.getResultList();
	}

	@Override
	public Role updateRole(Role role) {
		EntityManager entityManager = JPAConfig.getEntityManager();
		EntityTransaction transaction = entityManager.getTransaction();

		try {
			transaction.begin();

			// Cập nhật role (merge trả về đối tượng đã được quản lý)
			Role updatedRole = entityManager.merge(role);

			transaction.commit();

			return updatedRole;
		} catch (Exception e) {
			if (transaction.isActive()) {
				transaction.rollback();
			}
			e.printStackTrace();
			return null;
		} finally {
			entityManager.close();
		}
	}

	@Override
	public Role findByUserId(int userId) {
		EntityManager enma = JPAConfig.getEntityManager();
		try {
			TypedQuery<Role> query = enma.createQuery("SELECT u.role FROM User u WHERE u.id = :userId", Role.class);
			query.setParameter("userId", userId);
			return query.getSingleResult();
		} finally {
			enma.close();
		}
	}
	@Override
	public List<Role> findAll() {
		EntityManager enma = JPAConfig.getEntityManager();
		try {
			TypedQuery<Role> query = enma.createQuery("SELECT r FROM Role r", Role.class);
			return query.getResultList();
		} finally {
			enma.close();
		}
	}

}
