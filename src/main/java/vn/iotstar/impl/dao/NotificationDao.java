package vn.iotstar.impl.dao;

import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;
import jakarta.persistence.TypedQuery;
import vn.iotstar.dao.INotificationDao;
import vn.iotstar.entity.Notification;

public class NotificationDao implements INotificationDao {
	private EntityManagerFactory emf = Persistence.createEntityManagerFactory("jpa-hibernate-mysql");

	@Override
	public void save(Notification notification) {
		EntityManager em = emf.createEntityManager();
		EntityTransaction trans = em.getTransaction();
		try {
			trans.begin();
			em.persist(notification);
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			if (trans.isActive())
				trans.rollback();
		} finally {
			if (em != null && em.isOpen()) {
				em.close();
			}
		}
	}
	@Override
	public List<Notification> getAllNotifications() {
	    EntityManager em = emf.createEntityManager();
	    List<Notification> notifications = new ArrayList<>();
	    try {
	        String queryStr = "SELECT n FROM Notification n";
	        TypedQuery<Notification> query = em.createQuery(queryStr, Notification.class);
	        notifications = query.getResultList();
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        if (em != null && em.isOpen()) {
	            em.close();
	        }
	    }
	    return notifications;
	}
}
