package vn.edu.iuh.fit.backend;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;
import vn.edu.iuh.fit.backend.db.DBConnection;
import vn.edu.iuh.fit.backend.models.Product;

import java.util.List;

public class test {
    public static List<Product> getAllProducts() {
        EntityManager entityManager = DBConnection.getInstance().getEntityManager();
        try {
            entityManager.getTransaction().begin();

            // Sử dụng JPQL để lấy tất cả sản phẩm (thay vì SQL nguyên thủy)
            TypedQuery<Product> query = entityManager.createQuery("SELECT p FROM Product p", Product.class);
            List<Product> products = query.getResultList();

            entityManager.getTransaction().commit();
            return products;
        } catch (Exception e) {
            if (entityManager.getTransaction().isActive()) {
                entityManager.getTransaction().rollback();
            }
            throw e; // Bạn cần xử lý hoặc log lỗi ở đây nếu cần thiết.
        } finally {
            entityManager.close();
        }
    }

    public static void main(String[] args) {
        for (Product allProduct : getAllProducts()) {
            System.out.println(allProduct);
        }


    }
}
