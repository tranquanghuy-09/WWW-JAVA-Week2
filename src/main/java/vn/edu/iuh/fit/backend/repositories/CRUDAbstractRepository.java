package vn.edu.iuh.fit.backend.repositories;

import jakarta.persistence.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import vn.edu.iuh.fit.backend.db.DBConnection;
import vn.edu.iuh.fit.backend.models.Employee;

public abstract class CRUDAbstractRepository<T> {
    private EntityManager em;
    private EntityTransaction trans;
    private final Logger logger = LoggerFactory.getLogger(this.getClass().getName());
    public CRUDAbstractRepository() {
        em = DBConnection.getInstance().getEntityManager();
        trans = em.getTransaction();
    }
    public boolean insertEmp(T t) {
        try {
            trans.begin();
            em.persist(t);
            trans.commit();
            return true;
        } catch (Exception ex) {
            trans.rollback();
            logger.error(ex.getMessage());
        }
        return false;
    }
    public boolean update(T t) {
        try {
            trans.begin();
            em.merge(t);
            trans.commit();
            return true;
        } catch (Exception ex) {
            trans.rollback();
            logger.error(ex.getMessage());
        }
        return false;
    }
}
