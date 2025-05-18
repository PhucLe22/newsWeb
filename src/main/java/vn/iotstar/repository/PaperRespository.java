package vn.iotstar.repository;


import java.awt.print.Paper;
import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import vn.iotstar.entity.User;

public class PaperRespository {
    @PersistenceContext
    private EntityManager entityManager;

    public List<Paper> findFavoriteCoursesByUser(User user) {
        return entityManager.createQuery(
            "SELECT c FROM Paper c JOIN c.users u WHERE u.id = :userId", 
            Paper.class
        )
        .setParameter("userId", user.getId())
        .getResultList();
    }
}
